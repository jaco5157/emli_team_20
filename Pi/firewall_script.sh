#!/sbin/nft -f

define WAN0 = wlp3s0

flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0;
        # Drop all incoming packets by default
        policy drop;

        # Allow SSH (TCP port 22)
        ct state new,established,related tcp dport 22 accept

        # Allow HTTP (TCP port 80)
        ct state new,established,related tcp dport 80 accept
    }

    chain forward {
        type filter hook forward priority 0;
        # route your own packets
        policy accept;
    }

    chain output {
        type filter hook output priority 0;
        policy accept;
    }
}

table ip nat {
    chain prerouting {
        type nat hook prerouting priority 0;
        policy accept;
    }

    chain postrouting {
        type nat hook postrouting priority 100;
        policy accept;
        oifname $WAN0 masquerade;
    }
}
