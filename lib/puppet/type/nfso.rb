require 'pathname' 
Puppet::Type.newtype(:nfso) do
	@doc = "Manages the AIX nfso kernel tunables
		See the man page for the full details for this command.
		
		Example:
		nfso { 'nfso_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end

	newproperty(:portcheck) do
		desc "Checks whether an NFS request originated from a privileged port."
	end

	newproperty(:nfs_use_reserved_ports) do
		desc "Specifies using nonreserved IP port number."
	end
end
