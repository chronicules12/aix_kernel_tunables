require 'pathname' 
Puppet::Type.newtype(:asoo) do
	@doc = "Manages the AIX asoo kernel tunables
		See the man page for the full details for this command.
		
		Example:
		asoo { 'asoo_tunables':
			your_tunable_parameter => your_tunable_value,
			your_next_tunable_parameter => your_tunable_value,
		}
	"

	newparam(:name) do
		isnamevar
	end

	newproperty(:aso_active) do
		desc "Disables ASO."
	end

	newproperty(:debug_level) do
		desc "Specifies the ASO debug logging level."
	end
end