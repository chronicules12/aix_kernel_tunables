require 'pathname' 
Puppet::Type.newtype(:ioo) do
	@doc = "Manages the AIX ioo kernel tunables
		See the man page for the full details for this command.
			
		Example:
		ioo { 'ioo_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end

	newproperty(:aio_active) do
		desc "Indicates whether the AIO kernel extension has been used and pinned"
	end

	newproperty(:aio_maxreqs) do
		desc "Specifies the maximum number of asynchronous I/O requests that can be outstanding at one time"
	end

	newproperty(:aio_maxservers) do
		desc "Specifies the maximum number of AIO servers (kernel processes dedicated to asynchronous I/O processing) allowed to service slow path I/O requests."
	end

	newproperty(:aio_minservers) do
		desc "Specifies the minimum number of AIO servers (kernel processes dedicated to asynchronous I/O processing) that remain active to process slow path I/O requests."
	end

	newproperty(:aio_server_inactivity) do
		desc "Specifies how long an AIO server will sleep without servicing an I/O request."
	end

	newproperty(:j2_atimeUpdateSymlink) do
		desc "If j2_atimeUpdateSymlink is set to 1, then the access time of JFS2 symbolic links is updated on readlink."
	end

	newproperty(:j2_dynamicBufferPreallocation) do
		desc "Specifies the number of 16K slabs to preallocate when the filesystem is running low of bufstructs."
	end
 
	newproperty(:j2_inodeCacheSize) do
		desc "Controls the amount of memory Enhanced JFS will use for the inode cache."
	end

	newproperty(:j2_maxPageReadAhead) do
		desc "Specifies the maximum number of pages to be read ahead when processing a sequentially accessed file on Enhanced JFS."
	end

	newproperty(:j2_maxRandomWrite) do
		desc "Specifies a threshold for random writes to accumulate in RAM before subsequent pages are flushed to disk by the Enhanced JFS's write-behind algorithm."
	end

	newproperty(:j2_metadataCacheSize) do
		desc "Controls the amount of memory Enhanced JFS will use for the metadata cache."
	end
	
	newproperty(:j2_minPageReadAhead) do
		desc "Specifies the minimum number of pages to be read ahead when processing a sequentially accessed file on Enhanced JFS."
	end
	
	newproperty(:j2_nPagesPerWriteBehindCluster) do
		desc "Specifies the number of pages per cluster processed by Enhanced JFS's write behind algorithm."
	end

	newproperty(:j2_nRandomCluster) do
		desc "Specifies the distance apart (in clusters) that writes have to exceed in order for them to be considered as random by the Enhanced JFS's random write behind algorithm."
	end

	newproperty(:j2_recoveryMode) do
		desc "Sets the behavior for recovery from JFS2 write errors."
	end

	newproperty(:j2_syncPageCount) do
		desc "Sets the maximum number of modified pages of a file that will be written to disk by the sync system call in a single operation."
	end
	
	newproperty(:j2_syncPageLimit) do
		desc "Sets the maximum number of times that the sync system call will use j2_syncPageCount to limit pages written before increasing that count to allow progress on the sync operation."
	end
	
	newproperty(:lvm_bufcnt) do
		desc "Specifies the number of LVM buffers for raw physical I/Os."
	end

	newproperty(:maxpgahead) do
		desc "Specifies the maximum number of pages to be read ahead when processing a sequentially accessed file."
	end

	newproperty(:maxrandwrt) do
		desc "Specifies a threshold (in 4 KB pages) for random writes to accumulate in RAM before subsequent pages are flushed to disk by the write-behind algorithm."
	end

	newproperty(:numclust) do
		desc "Specifies the number of 16 k clusters processed by the sequential write-behind algorithm of the VMM."
	end

	newproperty(:numfsbufs) do
		desc "Specifies the number of file system bufstructs."
	end

	newproperty(:pd_npages) do
		desc "Specifies the number of pages that should be deleted in one chunk from RAM when a file is deleted."
	end

	newproperty(:posix_aio_active) do
		desc "Indicates whether the AIO kernel extension has been used and pinned."
	end

	newproperty(:posix_aio_maxreqs) do
		desc "Specifies the maximum number of asynchronous I/O requests that can be outstanding at one time."
	end

	newproperty(:posix_aio_maxservers) do
		desc "Specifies the maximum number of AIO servers (kernel processes dedicated to asynchronous I/O processing) allowed to service slow path I/O requests."
	end

	newproperty(:posix_aio_minservers) do
		desc "Specifies the minimum number of AIO servers (kernel processes dedicated to asynchronous I/O processing) that remain active to process slow path I/O requests."
	end

	newproperty(:posix_aio_server_inactivity) do
		desc "Specifies how long an AIO server will sleep without servicing an I/O request."
	end

	newproperty(:spec_accessupdate) do
		desc "Indicates for devices how timestamp changes are reflected."
	end
end
