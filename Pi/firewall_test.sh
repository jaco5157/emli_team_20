!/sbin/nft -f

define WAN0 = wlp30s 

flush ruleset

table ip nat {
	chain prerouting {
		type nat hook prerouting priority 0; policy accept;
	}

	# for all packets to WAN, after routing, replace source address with 
primary IP of WAN interface
	chain postrouting {
		type nat hook postrouting priority 100; policy accept;
		oifname $WAN0 masquerade
	}
}
