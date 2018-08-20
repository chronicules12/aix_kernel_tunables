##
##	no.rb
##		-  Manages Input/Output tunable parameters
##
## Notes
## [kernel command] (-r) -o [tunable]=value
## [kernel command] -Fa (displays restricted parameters)
## [kernel command] -x [parameter]  (outputs values in CSV format for parsing)
##    tunable,current,default,reboot,min,max,unit,type,{dtunable }
##			where:
##				current = current value
##				default = default value
##				reboot = reboot value
##				min = minimal value
##				max = maximum value
##				unit = tunable unit of measure
##				type = parameter type: D (for Dynamic), S (for Static), R (for Reboot),
##					B (for Bosboot), M (for Mount), I (for Incremental),
##					C (for Connect), and d (for Deprecated)
##				dtunable = list of dependent tunable parameters
##
require 'open3'
Puppet::Type.type(:no).provide :aix do
  
  desc "manages kernel tunables for AIX no"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :no => 'no'

  def getvalue(attr)
    Open3.popen3("no -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_noarr = line.split(',')
     		if c_noarr[0] == attr
     		  return c_noarr[1]
    		end
      end
    end
  end

	
	###################
	## general_network
	###################
	##
	## newproperty(:sb_max)
	##
  def sb_max
    if getvalue("sb_max") == resource[:sb_max]
      return resource[:sb_max]
    end
  end

  def sb_max=(value)
    system('no -p -o sb_max='"#{resource[:sb_max]}")
  end
		
	##
	##	newproperty(:sockthresh)
	##
  def sockthresh
    if getvalue("sockthresh") == resource[:sockthresh]
      return resource[:sockthresh]
    end
  end

  def sockthresh=(value)
    system('no -p -o sockthresh='"#{resource[:sockthresh]}")
  end


	######################
	## tcp_network
	######################
	##
	##	newproperty(:clean_partial_conns)
	##
	def clean_partial_conns
    if getvalue("clean_partial_conns") == resource[:clean_partial_conns]
      return resource[:clean_partial_conns]
    end
  end

  def clean_partial_conns=(value)
    system('no -p -o clean_partial_conns='"#{resource[:clean_partial_conns]}")
  end
  
	##
	## newproperty(:rfc1323)
	##
	def rfc1323
    if getvalue("rfc1323") == resource[:rfc1323]
      return resource[:rfc1323]
    end
  end

  def rfc1323=(value)
    system('no -p -o rfc1323='"#{resource[:rfc1323]}")
  end

	##
	##	newproperty(:tcp_mssdflt)
	##
	def tcp_mssdflt
    if getvalue("tcp_mssdflt") == resource[:tcp_mssdflt]
      return resource[:tcp_mssdflt]
    end
  end

  def tcp_mssdflt=(value)
    system('no -p -o tcp_mssdflt='"#{resource[:tcp_mssdflt]}")
  end
  
	##
	##	newproperty(:tcp_recvspace)
	##
	def tcp_recvspace
    if getvalue("tcp_recvspace") == resource[:tcp_recvspace]
      return resource[:tcp_recvspace]
    end
  end

  def tcp_recvspace=(value)
    system('no -p -o tcp_recvspace='"#{resource[:tcp_recvspace]}")
  end  
  
	##
	##	newproperty(:tcp_sendspace)
	##
	def tcp_sendspace
    if getvalue("tcp_sendspace") == resource[:tcp_sendspace]
      return resource[:tcp_sendspace]
    end
  end

  def tcp_sendspace=(value)
    system('no -p -o tcp_sendspace='"#{resource[:tcp_sendspace]}")
  end    
  
	##
	##	newproperty(:tcp_tcpsecure)
	##
	def tcp_tcpsecure
    if getvalue("tcp_tcpsecure") == resource[:tcp_tcpsecure]
      return resource[:tcp_tcpsecure]
    end
  end

  def tcp_tcpsecure=(value)
    system('no -p -o tcp_tcpsecure='"#{resource[:tcp_tcpsecure]}")
  end

  ##
	##	newproperty(:tcp_ephemeral_low)
	##
	def tcp_ephemeral_low
    if getvalue("tcp_ephemeral_low") == resource[:tcp_ephemeral_low]
      return resource[:tcp_ephemeral_low]
    end
  end

  def tcp_ephemeral_low=(value)
    system('no -p -o tcp_ephemeral_low='"#{resource[:tcp_ephemeral_low]}")
  end  
  
	##
	##	newproperty(:tcp_ephemeral_high)
	##
	def tcp_ephemeral_high
    if getvalue("tcp_ephemeral_high") == resource[:tcp_ephemeral_high]
      return resource[:tcp_ephemeral_high]
    end
  end

  def tcp_ephemeral_high=(value)
    system('no -p -o tcp_ephemeral_high='"#{resource[:tcp_ephemeral_high]}")
  end   
  

	######################
	## udp_network
	######################
	##
	##	newproperty(:udp_sendspace)
	##
	def udp_sendspace
    if getvalue("udp_sendspace") == resource[:udp_sendspace]
      return resource[:udp_sendspace]
    end
  end

  def udp_sendspace=(value)
    system('no -p -o udp_sendspace='"#{resource[:udp_sendspace]}")
  end      

	##
	##	newproperty(:udp_recvspace)
	##
	def udp_recvspace
    if getvalue("udp_recvspace") == resource[:udp_recvspace]
      return resource[:udp_recvspace]
    end
  end

  def udp_recvspace=(value)
    system('no -p -o udp_recvspace='"#{resource[:udp_recvspace]}")
  end
  
  ##
	##	newproperty(:udp_ephemeral_low)
	##
	def udp_ephemeral_low
    if getvalue("udp_ephemeral_low") == resource[:udp_ephemeral_low]
      return resource[:udp_ephemeral_low]
    end
  end

  def udp_ephemeral_low=(value)
    system('no -p -o udp_ephemeral_low='"#{resource[:udp_ephemeral_low]}")
  end  
  
	##
	##	newproperty(:tcp_ephemeral_high)
	##
	def udp_ephemeral_high
    if getvalue("udp_ephemeral_high") == resource[:udp_ephemeral_high]
      return resource[:udp_ephemeral_high]
    end
  end

  def udp_ephemeral_high=(value)
    system('no -p -o udp_ephemeral_high='"#{resource[:udp_ephemeral_high]}")
  end   


	######################
	## ip_network
	######################
	##
	##	newproperty(:directed_broadcast)
	##
	def directed_broadcast
    if getvalue("directed_broadcast") == resource[:directed_broadcast]
      return resource[:directed_broadcast]
    end
  end

  def directed_broadcast=(value)
    system('no -p -o directed_broadcast='"#{resource[:directed_broadcast]}")
  end

	##
	##	newproperty(:ip6srcrouteforward)
	##
	def ip6srcrouteforward
    if getvalue("ip6srcrouteforward") == resource[:ip6srcrouteforward]
      return resource[:ip6srcrouteforward]
    end
  end

  def ip6srcrouteforward=(value)
    system('no -p -o ip6srcrouteforward='"#{resource[:ip6srcrouteforward]}")
  end
  
	##
	##	newproperty(:ipforwarding)
	##
	def ipforwarding
    if getvalue("ipforwarding") == resource[:ipforwarding]
      return resource[:ipforwarding]
    end
  end

  def ipforwarding=(value)
    system('no -p -o ipforwarding='"#{resource[:ipforwarding]}")
  end  
  
 	##
	##	newproperty(:ipignoreredirects)
	##
	def ipignoreredirects
    if getvalue("ipignoreredirects") == resource[:ipignoreredirects]
      return resource[:ipignoreredirects]
    end
  end

  def ipignoreredirects=(value)
    system('no -p -o ipignoreredirects='"#{resource[:ipignoreredirects]}")
  end   
  
 	##
	##	newproperty(:ipsendredirects)
	##
	def ipsendredirects
    if getvalue("ipsendredirects") == resource[:ipsendredirects]
      return resource[:ipsendredirects]
    end
  end

  def ipsendredirects=(value)
    system('no -p -o ipsendredirects='"#{resource[:ipsendredirects]}")
  end     
  
  ##
	##	newproperty(:ipsrcrouteforward)
	##
	def ipsrcrouteforward
    if getvalue("ipsrcrouteforward") == resource[:ipsrcrouteforward]
      return resource[:ipsrcrouteforward]
    end
  end

  def ipsrcrouteforward=(value)
    system('no -p -o ipsrcrouteforward='"#{resource[:ipsrcrouteforward]}")
  end      
  
  ##
	##	newproperty(:ipsrcrouterecv)
	##
	def ipsrcrouterecv
    if getvalue("ipsrcrouterecv") == resource[:ipsrcrouterecv]
      return resource[:ipsrcrouterecv]
    end
  end

  def ipsrcrouterecv=(value)
    system('no -p -o ipsrcrouterecv='"#{resource[:ipsrcrouterecv]}")
  end
  
  ##
	##	newproperty(:ipsrcroutesend)
	##
	def ipsrcroutesend
    if getvalue("ipsrcroutesend") == resource[:ipsrcroutesend]
      return resource[:ipsrcroutesend]
    end
  end

  def ipsrcroutesend=(value)
    system('no -p -o ipsrcroutesend='"#{resource[:ipsrcroutesend]}")
  end
  
  ##
	##	newproperty(:nonlocsrcroute)
	##
	def nonlocsrcroute
    if getvalue("nonlocsrcroute") == resource[:nonlocsrcroute]
      return resource[:nonlocsrcroute]
    end
  end

  def nonlocsrcroute=(value)
    system('no -p -o nonlocsrcroute='"#{resource[:nonlocsrcroute]}")
  end 

  #
	##	newproperty(:ipqmaxlen)
	##
	def ipqmaxlen
    if getvalue("ipqmaxlen") == resource[:ipqmaxlen]
      return resource[:ipqmaxlen]
    end
  end

  def ipqmaxlen=(value)
    system('no -r -o ipqmaxlen='"#{resource[:ipqmaxlen]}")
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
  ##
	## newproperty(:bcastping)
	##
	def bcastping
    if getvalue("bcastping") == resource[:bcastping]
      return resource[:bcastping]
    end
  end

  def bcastping=(value)
    system('no -p -o bcastping='"#{resource[:bcastping]}")
  end 

  ##
	## newproperty(:icmpaddressmask)
	##
	def icmpaddressmask
    if getvalue("icmpaddressmask") == resource[:icmpaddressmask]
      return resource[:icmpaddressmask]
    end
  end

  def icmpaddressmask=(value)
    system('no -p -o icmpaddressmask='"#{resource[:icmpaddressmask]}")
  end 

  ##
	## newproperty(:rtentry_lock_complex)
	##
	def rtentry_lock_complex
    if getvalue("rtentry_lock_complex") == resource[:rtentry_lock_complex]
      return resource[:rtentry_lock_complex]
    end
  end

  def rtentry_lock_complex=(value)
    system('no -r -o rtentry_lock_complex='"#{resource[:rtentry_lock_complex]}")
  end   
  
  ##
	##	newproperty(:tcp_pmtu_discover)
	##
	def tcp_pmtu_discover
    if getvalue("tcp_pmtu_discover") == resource[:tcp_pmtu_discover]
      return resource[:tcp_pmtu_discover]
    end
  end

  def tcp_pmtu_discover=(value)
    system('no -p -o tcp_pmtu_discover='"#{resource[:tcp_pmtu_discover]}")
  end     
  
  ##
	##	newproperty(:udp_pmtu_discover)
	##
	def udp_pmtu_discover
    if getvalue("udp_pmtu_discover") == resource[:udp_pmtu_discover]
      return resource[:udp_pmtu_discover]
    end
  end

  def udp_pmtu_discover=(value)
    system('no -p -o udp_pmtu_discover='"#{resource[:udp_pmtu_discover]}")
  end   
  
  
	######################
	## restricted
	######################
  ##
	##	newproperty(:use_isno)
	##
	def use_isno
    if getvalue("use_isno") == resource[:use_isno]
      return resource[:use_isno]
    end
  end

  def use_isno=(value)
    system('no -p -o use_isno='"#{resource[:use_isno]}")
  end   
end