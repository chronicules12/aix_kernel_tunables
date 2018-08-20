require 'pathname' 
Puppet::Type.newtype(:no) do
	@doc = "Manages the AIX no kernel tunables
		See the man page for the full details for this command.
		
		Example:
		no { 'no_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end


	######################
	## general_network
	######################
	newproperty(:sb_max) do
		desc "Specifies the maximum buffer size allowed for a TCP and UDP socket. Limits setsockopt, udp_sendspace, udp_recvspace, tcp_sendspace, and tcp_recvspace."
	end

	newproperty(:sockthresh) do
		desc "Specifies the maximum amount of network memory that can be allocated for sockets. Used to prevent new sockets or TCP connections from exhausting all MBUF memory and reserve the remaining memory for the existing sockets or TCP connections."
	end


	######################
	## tcp_network
	######################
	newproperty(:clean_partial_conns) do
		desc "Specifies whether or not we are avoiding SYN attacks. If non-zero, clean_partial_conns specifies how many partial connections to randomly remove to make room for new non-attack connections."
	end

	newproperty(:rfc1323) do
		desc "Enables TCP enhancements as specified by RFC 1323, TCP Extensions for High Performance."
	end

	newproperty(:tcp_mssdflt) do
		desc "Default maximum segment size used in communicating with remote networks."
	end

	newproperty(:tcp_recvspace) do
		desc "Specifies the system default socket buffer size for receiving data. This affects the window size used by TCP."
	end
	
	newproperty(:tcp_sendspace) do
		desc "Specifies the system default socket buffer size for sending data."
	end

	newproperty(:tcp_tcpsecure) do
		desc "Specifies whether or not connection reset attacks and data corruption attacks on TCP are avoided."
	end


	######################
	## udp_network
	######################
	newproperty(:udp_sendspace) do
		desc "Specifies the system default socket buffer size (in bytes) for sending UDP data. "
	end

	newproperty(:udp_recvspace) do
		desc "Specifies the system default socket buffer size for receiving UDP data."
	end


	######################
	## ip_network
	######################
	newproperty(:directed_broadcast) do
		desc "Specifies whether or not to allow a directed broadcast to a gateway."
	end

	newproperty(:ip6srcrouteforward) do
		desc "Specifies whether the system forwards source-routed IPv6 packets."
	end

	newproperty(:ipforwarding) do
		desc "Specifies whether the kernel should forward packets."
	end

	newproperty(:ipignoreredirects) do
		desc "Specifies whether or not to process redirects that are received."
	end
	
	newproperty(:ipsendredirects) do
		desc "Specifies whether the kernel should send redirect signals."
	end

	newproperty(:ipsrcrouteforward) do
		desc "Specifies whether the system forwards source routed packets."
	end

	newproperty(:ipsrcrouterecv) do
		desc "Specifies whether the system accepts source routed packets."
	end
	
	newproperty(:ipsrcroutesend) do
		desc "Specifies whether applications can send source routed packets."
	end

	newproperty(:nonlocsrcroute) do
		desc "Tells the Internet Protocol that strictly source-routed packets may be addressed to hosts outside the local network."
	end


	######################
	## arp_network
	######################

  
	######################
	## stream
	######################


	######################
	## others
	######################
	newproperty(:bcastping) do
		desc "Allows response to ICMP echo packets to the broadcast address."
	end

	newproperty(:icmpaddressmask) do
		desc "Specifies whether the system responds to an ICMP address mask request."
	end
	
	newproperty(:rtentry_lock_complex) do
		desc "Specifies the type of Lock to be used for RTENTRY Lock macros."
	end

	newproperty(:tcp_pmtu_discover) do
		desc "Enables or disables path MTU discovery for TCP applications."
	end

	newproperty(:udp_pmtu_discover) do
		desc "Enables or disables path MTU discovery for UDP applications."
	end


	######################
	## restricted
	######################
	newproperty(:use_isno) do
		desc "Enables the use of Interface Specific Network Options."
	end
end
