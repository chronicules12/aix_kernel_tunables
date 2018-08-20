##
##	ioo.rb
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
Puppet::Type.type(:ioo).provide :aix do
  
  desc "manages kernel tunables for AIX ioo"

	confine :operatingsystem => :AIX
  defaultfor :operatingsystem => :AIX
  
  commands :ioo => 'ioo'

  def getvalue(attr)
    Open3.popen3("ioo -x #{attr}") do |stdin, stdout, stderr|
    	stdout.each do |line|
    		c_iooarr = line.split(',')
     		if c_iooarr[0] == attr
     		  return c_iooarr[1]
    		end
      end
    end
  end

### Removing the aio_active definition. Starting with AIX 6, this is an automatic definition. 
### AIX will flip this to enabled upon request
	##
	## newproperty(:aio_active)
	##
#  def aio_active
#    if getvalue("aio_active") == resource[:aio_active]
#      return resource[:aio_active]
#    end
#  end
#
#  def aio_active=(value)
#    system('ioo -p -o aio_active='"#{resource[:aio_active]}")
#  end
		
	##
	## newproperty(:aio_maxreqs)
	##
  def aio_maxreqs
    if getvalue("aio_maxreqs") == resource[:aio_maxreqs]
      return resource[:aio_maxreqs]
    end
  end

  def aio_maxreqs=(value)
    system('ioo -p -o aio_maxreqs='"#{resource[:aio_maxreqs]}")
  end
		
	##
	## newproperty(:aio_maxservers)
	##
  def aio_maxservers
    if getvalue("aio_maxservers") == resource[:aio_maxservers]
      return resource[:aio_maxservers]
    end
  end

  def aio_maxservers=(value)
    system('ioo -p -o aio_maxservers='"#{resource[:aio_maxservers]}")
  end
		
	##
	## newproperty(:aio_minservers)
	##
  def aio_minservers
    if getvalue("aio_minservers") == resource[:aio_minservers]
      return resource[:aio_minservers]
    end
  end

  def aio_minservers=(value)
    system('ioo -p -o aio_minservers='"#{resource[:aio_minservers]}")
  end
		
	##
	## newproperty(:aio_server_inactivity)
	##
  def aio_server_inactivity
    if getvalue("aio_server_inactivity") == resource[:aio_server_inactivity]
      return resource[:aio_server_inactivity]
    end
  end

  def aio_server_inactivity=(value)
    system('ioo -p -o aio_server_inactivity='"#{resource[:aio_server_inactivity]}")
  end
		
	##
	## newproperty(:j2_atimeUpdateSymlink)
	##
  def j2_atimeUpdateSymlink
    if getvalue("j2_atimeUpdateSymlink") == resource[:j2_atimeUpdateSymlink]
      return resource[:j2_atimeUpdateSymlink]
    end
  end

  def j2_atimeUpdateSymlink=(value)
    system('ioo -p -o j2_atimeUpdateSymlink='"#{resource[:j2_atimeUpdateSymlink]}")
  end
		
	##
	## newproperty(:j2_dynamicBufferPreallocation)
	##
  def j2_dynamicBufferPreallocation
    if getvalue("j2_dynamicBufferPreallocation") == resource[:j2_dynamicBufferPreallocation]
      return resource[:j2_dynamicBufferPreallocation]
    end
  end

  def j2_dynamicBufferPreallocation=(value)
    system('ioo -p -o j2_dynamicBufferPreallocation='"#{resource[:j2_dynamicBufferPreallocation]}")
  end
		
	##
	## newproperty(:j2_inodeCacheSize)
	##
  def j2_inodeCacheSize
    if getvalue("j2_inodeCacheSize") == resource[:j2_inodeCacheSize]
      return resource[:j2_inodeCacheSize]
    end
  end

  def j2_inodeCacheSize=(value)
    system('ioo -p -o j2_inodeCacheSize='"#{resource[:j2_inodeCacheSize]}")
  end
		
	##
	## newproperty(:j2_maxPageReadAhead)
	##
  def j2_maxPageReadAhead
    if getvalue("j2_maxPageReadAhead") == resource[:j2_maxPageReadAhead]
      return resource[:j2_maxPageReadAhead]
    end
  end

  def j2_maxPageReadAhead=(value)
    system('ioo -p -o j2_maxPageReadAhead='"#{resource[:j2_maxPageReadAhead]}")
  end
		
	##
	## newproperty(:j2_maxRandomWrite)
	##
  def j2_maxRandomWrite
    if getvalue("j2_maxRandomWrite") == resource[:j2_maxRandomWrite]
      return resource[:j2_maxRandomWrite]
    end
  end

  def j2_maxRandomWrite=(value)
    system('ioo -p -o j2_maxRandomWrite='"#{resource[:j2_maxRandomWrite]}")
  end
		
	##
	## newproperty(:j2_metadataCacheSize)
	##
  def j2_metadataCacheSize
    if getvalue("j2_metadataCacheSize") == resource[:j2_metadataCacheSize]
      return resource[:j2_metadataCacheSize]
    end
  end

  def j2_metadataCacheSize=(value)
    system('ioo -p -o j2_metadataCacheSize='"#{resource[:j2_metadataCacheSize]}")
  end
		
	##
	## newproperty(:j2_minPageReadAhead)
	##
  def j2_minPageReadAhead
    if getvalue("j2_minPageReadAhead") == resource[:j2_minPageReadAhead]
      return resource[:j2_minPageReadAhead]
    end
  end

  def j2_minPageReadAhead=(value)
    system('ioo -p -o j2_minPageReadAhead='"#{resource[:j2_minPageReadAhead]}")
  end
		
	##
	## newproperty(:j2_nPagesPerWriteBehindCluster)
	##
  def j2_nPagesPerWriteBehindCluster
    if getvalue("j2_nPagesPerWriteBehindCluster") == resource[:j2_nPagesPerWriteBehindCluster]
      return resource[:j2_nPagesPerWriteBehindCluster]
    end
  end

  def j2_nPagesPerWriteBehindCluster=(value)
    system('ioo -p -o j2_nPagesPerWriteBehindCluster='"#{resource[:j2_nPagesPerWriteBehindCluster]}")
  end
		
	##
	## newproperty(:j2_nRandomCluster)
	##
  def j2_nRandomCluster
    if getvalue("j2_nRandomCluster") == resource[:j2_nRandomCluster]
      return resource[:j2_nRandomCluster]
    end
  end

  def j2_nRandomCluster=(value)
    system('ioo -p -o j2_nRandomCluster='"#{resource[:j2_nRandomCluster]}")
  end
		
	##
	## newproperty(:j2_recoveryMode)
	##
  def j2_recoveryMode
    if getvalue("j2_recoveryMode") == resource[:j2_recoveryMode]
      return resource[:j2_recoveryMode]
    end
  end

  def j2_recoveryMode=(value)
    system('ioo -p -o j2_recoveryMode='"#{resource[:j2_recoveryMode]}")
  end
		
	##
	## newproperty(:j2_syncPageCount)
	##
  def j2_syncPageCount
    if getvalue("j2_syncPageCount") == resource[:j2_syncPageCount]
      return resource[:j2_syncPageCount]
    end
  end

  def j2_syncPageCount=(value)
    system('ioo -p -o j2_syncPageCount='"#{resource[:j2_syncPageCount]}")
  end
		
	##
	## newproperty(:j2_syncPageLimit)
	##
  def j2_syncPageLimit
    if getvalue("j2_syncPageLimit") == resource[:j2_syncPageLimit]
      return resource[:j2_syncPageLimit]
    end
  end

  def j2_syncPageLimit=(value)
    system('ioo -p -o j2_syncPageLimit='"#{resource[:j2_syncPageLimit]}")
  end
		
	##
	## newproperty(:lvm_bufcnt)
	##
  def lvm_bufcnt
    if getvalue("lvm_bufcnt") == resource[:lvm_bufcnt]
      return resource[:lvm_bufcnt]
    end
  end

  def lvm_bufcnt=(value)
    system('ioo -p -o lvm_bufcnt='"#{resource[:lvm_bufcnt]}")
  end
		
	##
	## newproperty(:maxpgahead)
	##
  def maxpgahead
    if getvalue("maxpgahead") == resource[:maxpgahead]
      return resource[:maxpgahead]
    end
  end

  def maxpgahead=(value)
    system('ioo -p -o maxpgahead='"#{resource[:maxpgahead]}")
  end
		
	##
	## newproperty(:maxrandwrt)
	##
  def maxrandwrt
    if getvalue("maxrandwrt") == resource[:maxrandwrt]
      return resource[:maxrandwrt]
    end
  end

  def maxrandwrt=(value)
    system('ioo -p -o maxrandwrt='"#{resource[:maxrandwrt]}")
  end
		
	##
	## newproperty(:numclust)
	##
  def numclust
    if getvalue("numclust") == resource[:numclust]
      return resource[:numclust]
    end
  end

  def numclust=(value)
    system('ioo -p -o numclust='"#{resource[:numclust]}")
  end
		
	##
	## newproperty(:numfsbufs)
	##
  def numfsbufs
    if getvalue("numfsbufs") == resource[:numfsbufs]
      return resource[:numfsbufs]
    end
  end

  def numfsbufs=(value)
    system('ioo -p -o numfsbufs='"#{resource[:numfsbufs]}")
  end
		
	##
	## newproperty(:pd_npages)
	##
  def pd_npages
    if getvalue("pd_npages") == resource[:pd_npages]
      return resource[:pd_npages]
    end
  end

  def pd_npages=(value)
    system('ioo -p -o pd_npages='"#{resource[:pd_npages]}")
  end
		
	##
	## newproperty(:posix_aio_active)
	##
  def posix_aio_active
    if getvalue("posix_aio_active") == resource[:posix_aio_active]
      return resource[:posix_aio_active]
    end
  end

  def posix_aio_active=(value)
    system('ioo -p -o posix_aio_active='"#{resource[:posix_aio_active]}")
  end
		
	##
	## newproperty(:posix_aio_maxreqs)
	##
	  def posix_aio_maxreqs
    if getvalue("posix_aio_maxreqs") == resource[:posix_aio_maxreqs]
      return resource[:posix_aio_maxreqs]
    end
  end

  def posix_aio_maxreqs=(value)
    system('ioo -p -o posix_aio_maxreqs='"#{resource[:posix_aio_maxreqs]}")
  end
	
	##
	## newproperty(:posix_aio_maxservers)
	##
  def posix_aio_maxservers
    if getvalue("posix_aio_maxservers") == resource[:posix_aio_maxservers]
      return resource[:posix_aio_maxservers]
    end
  end

  def posix_aio_maxservers=(value)
    system('ioo -p -o posix_aio_maxservers='"#{resource[:posix_aio_maxservers]}")
  end
	
	##
	## newproperty(:posix_aio_minservers)
	##
	def posix_aio_minservers
    if getvalue("posix_aio_minservers") == resource[:posix_aio_minservers]
      return resource[:posix_aio_minservers]
    end
  end

  def posix_aio_minservers=(value)
    system('ioo -p -o posix_aio_minservers='"#{resource[:posix_aio_minservers]}")
  end
	
	##
	## newproperty(:posix_aio_server_inactivity)
	##
  def posix_aio_server_inactivity
    if getvalue("posix_aio_server_inactivity") == resource[:posix_aio_server_inactivity]
      return resource[:posix_aio_server_inactivity]
    end
  end

  def posix_aio_server_inactivity=(value)
    system('ioo -p -o posix_aio_server_inactivity='"#{resource[:posix_aio_server_inactivity]}")
  end
		
	##
	## newproperty(:spec_accessupdate)
	##
  def spec_accessupdate
    if getvalue("spec_accessupdate") == resource[:spec_accessupdate]
      return resource[:spec_accessupdate]
    end
  end

  def spec_accessupdate=(value)
    system('ioo -p -o spec_accessupdate='"#{resource[:spec_accessupdate]}")
  end
end












































































































































































































