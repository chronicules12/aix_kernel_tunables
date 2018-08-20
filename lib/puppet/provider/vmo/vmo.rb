##
##	vmo.rb
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
Puppet::Type.type(:vmo).provide :aix do
  
  desc "manages kernel tunables for AIX vmo"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :vmo => 'vmo'

  def getvalue(attr)
    Open3.popen3("vmo -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_vmoarr = line.split(',')
     		if c_vmoarr[0] == attr
     		  return c_vmoarr[1].to_s
    		end
      end
    end
  end

	##
	## newproperty(:lgpg_regions)
	##
  def lgpg_regions
    if getvalue("lgpg_regions") == resource[:lgpg_regions]
      return resource[:lgpg_regions]
    end
  end

  def lgpg_regions=(value)
    system('vmo -p -o lgpg_regions='"#{resource[:lgpg_regions]}")
  end
		
	##
	## newproperty(:lgpg_size)
	##
  def lgpg_size
    if getvalue("lgpg_size") == resource[:lgpg_size]
      return resource[:lgpg_size]
    end
  end

  def lgpg_size=(value)
    system('vmo -p -o lgpg_size='"#{resource[:lgpg_size]}")
  end
  
  ##
	## newproperty(:maxfree)
	##
  def maxfree
    if getvalue("maxfree") == resource[:maxfree]
      return resource[:maxfree]
    end
  end

  def maxfree=(value)
    system('vmo -p -o maxfree='"#{resource[:maxfree]}")
  end
		
	##
	## newproperty(:maxpin_pct)
	##
  def maxpin_pct
    if getvalue("maxpin_pct") == resource[:maxpin_pct]
      return resource[:maxpin_pct]
    end
  end

	def maxpin_pct=(value)
    system('vmo -p -o maxpin%='"#{resource[:maxpin_pct]}")
	end
  
 	##
	## newproperty(:minfree)
	##
  def minfree
    if getvalue("minfree") == resource[:minfree]
      return resource[:minfree]
    end
  end

  def minfree=(value)
    system('vmo -p -o minfree='"#{resource[:minfree]}")
  end
  
  ##
	## newproperty(:minperm_pct)
	##
  def minperm_pct
    if getvalue("minperm_pct") == resource[:minperm_pct]
      return resource[:minperm_pct]
    end
  end

  def minperm_pct=(value)
    system('vmo -p -o minperm%='"#{resource[:minperm_pct]}")
  end
		
	##
	## newproperty(:v_pinshm)
	##
  def v_pinshm
    if getvalue("v_pinshm") == resource[:v_pinshm]
      return resource[:v_pinshm]
    end
  end

  def v_pinshm=(value)
    system('vmo -p -o v_pinshm='"#{resource[:v_pinshm]}")
  end 
  
  
	#######################
	##  RESTRICTED
	#######################
 	##
	## newproperty(:esid_allocator)
	##
  def esid_allocator
    if getvalue("esid_allocator") == resource[:esid_allocator]
			return resource[:esid_allocator]
    end
  end

  def esid_allocator=(value)
    system('vmo -p -o esid_allocator='"#{resource[:esid_allocator]}")
  end
  
  ##
	## newproperty(:lru_poll_interval)
	##
  def lru_poll_interval
    if getvalue("lru_poll_interval") == resource[:lru_poll_interval]
      return resource[:lru_poll_interval]
    end
  end

  def lru_poll_interval=(value)
    system('vmo -p -o lru_poll_interval='"#{resource[:lru_poll_interval]}")
  end
		
	##
	## newproperty(:maxperm_pct)
	##
  def maxperm_pct
    if getvalue("maxperm_pct") == resource[:maxperm_pct]
      return resource[:maxperm_pct]
    end
  end

  def maxperm_pct=(value)
    system('vmo -p -o maxperm%='"#{resource[:maxperm_pct]}")
  end 

 	##
	## newproperty(:memory_affinity)
	##
  def memory_affinity
    if getvalue("memory_affinity") == resource[:memory_affinity]
      return resource[:memory_affinity]
    end
  end

  def memory_affinity=(value)
    system('vmo -p -o memory_affinity='"#{resource[:memory_affinity]}")
  end
  
  ##
	## newproperty(:page_steal_method)
	##
  def page_steal_method
    if getvalue("page_steal_method") == resource[:page_steal_method]
      return resource[:page_steal_method]
    end
  end

  def page_steal_method=(value)
    system('vmo -p -o page_steal_method='"#{resource[:page_steal_method]}")
  end
		
	##
	## newproperty(:strict_maxclient)
	##
  def strict_maxclient
    if getvalue("strict_maxclient") == resource[:strict_maxclient]
      return resource[:strict_maxclient]
    end
  end

  def strict_maxclient=(value)
    system('vmo -p -o strict_maxclient='"#{resource[:strict_maxclient]}")
  end 

  ##
	## newproperty(:strict_maxperm)
	##
  def strict_maxperm
    if getvalue("strict_maxperm") == resource[:strict_maxperm]
      return resource[:strict_maxperm]
    end
  end

  def strict_maxperm=(value)
    system('vmo -p -o strict_maxperm='"#{resource[:strict_maxperm]}")
  end
  
	##
	## newproperty(:vmm_klock_mode)
	##
  def vmm_klock_mode
    if getvalue("vmm_klock_mode") == resource[:vmm_klock_mode]
      return resource[:strict_maxclient]
    end
  end

  def vmm_klock_mode=(value)
    system('vmo -o vmm_klock_mode='"#{resource[:vmm_klock_mode]}")
  end 
end
