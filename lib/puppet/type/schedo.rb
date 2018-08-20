require 'pathname' 
Puppet::Type.newtype(:schedo) do
	@doc = "Manages the AIX schedo kernel tunables
		See the man page for the full details for this command.
		
		Example:
		schedo { 'schedo_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end

	newproperty(:vpm_fold_policy) do
		desc "Controls the application of the virtual processor management feature of processor folding in a partition."
	end

	newproperty(:vpm_xvcpus) do
		desc "Setting this tunable to a value greater than -1 will enable the scheduler to enable and disable virtual processors based on the partition's CPU utilization."
	end
end

