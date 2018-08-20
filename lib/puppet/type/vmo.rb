require 'pathname' 
Puppet::Type.newtype(:vmo) do
	@doc = "Manages the AIX vmo kernel tunables
		See the man page for the full details for this command.
		
		Example:
		vmo { 'vmo_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end

	newproperty(:lgpg_regions) do
		desc "Specifies the number of large pages to reserve for implementing with the shmget() system call with the SHM_LGPAGE flag."
	end

	newproperty(:lgpg_size) do
		desc "Specifies the size in bytes of the hardware-supported large pages used for the implementation for the shmget() system call with the SHM_LGPAGE flag."
	end

	newproperty(:maxfree) do
		desc "Specifies the number of frames on the free list at which page-stealing is to stop."
	end

	newproperty(:maxpin_pct) do
		desc "Specifies the maximum percentage of real memory that can be pinned."
	end

	newproperty(:minfree) do
		desc "Specifies the number of frames on the free list at which the VMM starts to steal pages to replenish the free list."
	end

	newproperty(:minperm_pct) do
		desc "Specifies the point below which the page-stealer will steal file or computational pages regardless of repaging rates."
	end

	newproperty(:v_pinshm) do
		desc "If set to 1, will allow pinning of shared memory segments."
	end

	
	#######################
	##  RESTRICTED
	#######################
	newproperty(:esid_allocator) do
		desc "Turns on/off Large Segment Aliasing (LSA) effective address allocation policies."
	end

	newproperty(:lru_poll_interval) do
		desc "Determines the interval, in milliseconds, at which LRU page replacement daemons poll for off-level interrupts."
	end

	newproperty(:maxperm_pct) do
		desc "Specifies the point above which the page-stealing algorithm steals only file pages."
	end

	newproperty(:memory_affinity) do
		desc "Enables the VMM support for local memory allocation."
	end

	newproperty(:page_steal_method) do
		desc "Selects Virtual Memory Page Replacement policy."
	end

	newproperty(:strict_maxclient) do
		desc "If set to 1, the maxclient value will be a hard limit on how much of RAM can be used as a client file cache."
	end

	newproperty(:strict_maxperm) do
		desc "If set to 1, the maxperm value will be a hard limit on how much of RAM can be used as a persistent file cache."
	end

	newproperty(:vmm_klock_mode) do
		desc "Select the kernel memory locking mode."
	end
end

 