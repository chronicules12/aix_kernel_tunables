##
##	nfso.rb
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
Puppet::Type.type(:nfso).provide :aix do
  
  desc "manages kernel tunables for AIX nfso"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :nfso => 'nfso'

  def getvalue(attr)
    Open3.popen3("nfso -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_nfsoarr = line.split(',')
     		if c_nfsoarr[0] == attr
     		  return c_nfsoarr[1]
    		end
      end
    end
  end

	##
	## newproperty(:portcheck)
	##
  def portcheck
    if getvalue("portcheck") == resource[:portcheck]
      return resource[:portcheck]
    end
  end

  def portcheck=(value)
    system('nfso -p -o portcheck='"#{resource[:portcheck]}")
  end
		
	##
	## newproperty(:nfs_use_reserved_ports)
	##
  def nfs_use_reserved_ports
    if getvalue("nfs_use_reserved_ports") == resource[:nfs_use_reserved_ports]
      return resource[:nfs_use_reserved_ports]
    end
  end

  def nfs_use_reserved_ports=(value)
    system('nfso -p -o nfs_use_reserved_ports='"#{resource[:nfs_use_reserved_ports]}")
  end
end






































































































































































