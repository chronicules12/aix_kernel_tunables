# Puppet module to manage AIX kernel tunable settings #

This module is a custom type/provider taht enables the ability to manage AIX kernel tunables through puppet.

### Requirements

Module has been tested on:

 * PE Puppet 3.3
 * OS:
   * AIX 5.3
   * AIX 6.1
   * AIX 7.1

*Note:* This module does currently does not manage restricted tunable parameters.

### Example settings

```puppet
class { 'kernel_settings'
  asoo { 'default_settings':
    aso_active => '0',  
  }

  ioo { 'ioo_settings':
    aio_active  => '1',
    aio_maxreqs => '3'
  }

  nfso ( 'nfso_settings':
    portcheck => '1'
  }

  no { 'no_settings':
    sb_max => '32',
    tcp_recvspace '32890',
  }
  
  schedo { 'schedo_settings':
    vpm_fold_policy => '1',
  }
  
  vmo { 'vmo_tunables':
    maxfree => '32',
    minfree => '16',
  }
}
```

***