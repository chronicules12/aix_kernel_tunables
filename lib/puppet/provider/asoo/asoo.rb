##
##	asoo.rb
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
Puppet::Type.type(:asoo).provide :aix do
  
  desc "manages kernel tunables for AIX asoo"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :asoo => 'asoo'

  def getvalue(attr)
    Open3.popen3("asoo -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_asooarr = line.split(',')
     		if c_asooarr[0] == attr
     		  return c_asooarr[1]
    		end
      end
    end
  end

	##
	## newproperty(:aso_active)
	##
  def aso_active
    if getvalue("aso_active") == resource[:aso_active]
      return resource[:aso_active]
    end
  end

  def aso_active=(value)
    system('asoo -p -o aso_active='"#{resource[:aso_active]}")
  end
		
	##
	## newproperty(:debug_level)
	##
  def debug_level
    if getvalue("debug_level") == resource[:debug_level]
      return resource[:debug_level]
    end
  end

  def debug_level=(value)
    system('asoo -p -o debug_level='"#{resource[:debug_level]}")
  end
end







































































































































































