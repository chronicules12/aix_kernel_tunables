##
##	schedo.rb
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
Puppet::Type.type(:schedo).provide :aix do
  
  desc "manages kernel tunables for AIX schedo"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :schedo => 'schedo'

  def getvalue(attr)
    Open3.popen3("schedo -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_schedoarr = line.split(',')
     		if c_schedoarr[0] == attr
     		  return c_schedoarr[1]
    		end
      end
    end
  end

	##
	## newproperty(:vpm_fold_policy)
	##
  def vpm_fold_policy
    if getvalue("vpm_fold_policy") == resource[:vpm_fold_policy]
      return resource[:vpm_fold_policy]
    end
  end

  def vpm_fold_policy=(value)
    system('schedo -p -o vpm_fold_policy='"#{resource[:vpm_fold_policy]}")
  end
		
	##
	## newproperty(:vpm_xvcpus)
	##
  def vpm_xvcpus
    if getvalue("vpm_xvcpus") == resource[:vpm_xvcpus]
      return resource[:vpm_xvcpus]
    end
  end

  def vpm_xvcpus=(value)
    system('schedo -p -o vpm_xvcpus='"#{resource[:vpm_xvcpus]}")
  end
end
