# Class: Kernel parameters
#
# This module manages AIX kernel parameters
#
# Parameters:
#  * asoo
#  * ioo
#  * nfso
#  * no
#  * schedo
#  * vmo
#
# Actions:
#  * Stuff and things
#
# Requires: see Modulefile
#
# Sample Usage:
#
#class aix_kernel_tunables {
#  asoo { 'asoo_tunables':
#    aso_active  => your_tunable_value,
#    debug_level => your_tunable_value,
#  }
#
#  ioo { 'ioo_tunables':
#    aio_active                     => your_tunable_value,
#    aio_maxreqs                    => your_tunable_value,
#    aio_maxservers                 => your_tunable_value,
#    aio_minservers                 => your_tunable_value,
#    aio_server_inactivity          => your_tunable_value,
#    j2_atimeUpdateSymlink          => your_tunable_value,
#    j2_dynamicBufferPreallocation  => your_tunable_value,
#    j2_inodeCacheSize              => your_tunable_value,
#    j2_maxPageReadAhead            => your_tunable_value,
#    j2_maxRandomWrite              => your_tunable_value,
#    j2_metadataCacheSize           => your_tunable_value,
#    j2_minPageReadAhead            => your_tunable_value,
#    j2_nPagesPerWriteBehindCluster => your_tunable_value,
#    j2_nRandomCluster              => your_tunable_value,
#    j2_recoveryMode                => your_tunable_value,
#    j2_syncPageCount               => your_tunable_value,
#    j2_syncPageLimit               => your_tunable_value,
#    lvm_bufcnt                     => your_tunable_value,
#    maxpgahead                     => your_tunable_value,
#    maxrandwrt                     => your_tunable_value,
#    numclust                       => your_tunable_value,
#    numfsbufs                      => your_tunable_value,
#    pd_npages                      => your_tunable_value,
#    posix_aio_active               => your_tunable_value,
#    posix_aio_maxreq               => your_tunable_value,
#    posix_aio_maxservers           => your_tunable_value,
#    posix_aio_minservers           => your_tunable_value,
#    posix_aio_server_inactivity    => your_tunable_value,
#    spec_accessupdate              => your_tunable_value,
#  }
#
#  nfso { 'nfso_tunables':
#    portcheck              => your_tunable_value,
#    nfs_use_reserved_ports => your_tunable_value,
#  }
#
#  no { 'no_tunables':
#    sb_max               => your_tunable_value,
#    sockthresh           => your_tunable_value,
#    clean_partial_conns  => your_tunable_value,
#    rfc1323              => your_tunable_value,
#    tcp_mssdflt          => your_tunable_value,
#    tcp_recvspace        => your_tunable_value,
#    tcp_sendspace        => your_tunable_value,
#    tcp_tcpsecure        => your_tunable_value,
#    udp_sendspace        => your_tunable_value,
#    udp_recvspace        => your_tunable_value,
#    directed_broadcast   => your_tunable_value,
#    ip6srcrouteforward   => your_tunable_value,
#    ipforwarding         => your_tunable_value,
#    ipignoreredirects    => your_tunable_value,
#    ipsendredirects      => your_tunable_value,
#    ipsrcrouteforward    => your_tunable_value,
#    ipsrcrouterecv       => your_tunable_value,
#    ipsrcroutesend       => your_tunable_value,
#    nonlocsrcroute       => your_tunable_value,
#    bcastping            => your_tunable_value,
#    icmpaddressmask      => your_tunable_value,
#    rtentry_lock_complex => your_tunable_value,
#    tcp_pmtu_discover    => your_tunable_value,
#    udp_pmtu_discover    => your_tunable_value,
#    use_isno             => your_tunable_value,
#    ipqmaxlen            => your_tunable_value,
#    tcp_ephemeral_low    => your_tunable_value,
#    tcp_ephemeral_high   => your_tunable_value,
#    udp_ephemeral_low    => your_tunable_value,
#    udp_ephemeral_high   => your_tunabel_value,
#  }
#
#  schedo { 'schedo_tunables':
#    vpm_fold_policy => your_tunable_value,
#    vpm_xvcpus      => your_tunable_value,
#  }
#
#  vmo { 'vmo_tunables':
#    lgpg_regions => your_tunable_value,
#    lgpg_size    => your_tunable_value,
#    maxfree      => your_tunable_value,
#    maxpin_pct   => your_tunable_value,
#    minfree      => your_tunable_value,
#    minperm_pct  => your_tunable_value,
#    v_pinshm     => your_tunable_value,
#  }
#}
#

class aix_kernel_tunables (
  $aso_active                     = aix_kernel_tunables::params::aso_active,
  $debug_level                    = aix_kernel_tunables::params::debug_level,
  $aio_active                     = aix_kernel_tunables::params::aio_active,
  $aio_maxreqs                    = aix_kernel_tunables::params::aio_maxreqs,
  $aio_maxservers                 = aix_kernel_tunables::params::aio_maxservers, 
  $aio_minservers                 = aix_kernel_tunables::params::aio_minservers,
  $aio_server_inactivity          = aix_kernel_tunables::params::aio_server_inactivity,
  $j2_atimeUpdateSymlink          = aix_kernel_tunables::params::j2_atimeUpdateSymlink,
  $j2_dynamicBufferPreallocation  = aix_kernel_tunables::params::j2_dynamicBufferPreallocation,
  $j2_inodeCacheSize              = aix_kernel_tunables::params::j2_inodeCacheSize,
  $j2_maxPageReadAhead            = aix_kernel_tunables::params::j2_maxPageReadAhead,
  $j2_maxRandomWrite              = aix_kernel_tunables::params::j2_maxRandomWrite,
  $j2_metadataCacheSize           = aix_kernel_tunables::params::j2_metadataCacheSize,
  $j2_minPageReadAhead            = aix_kernel_tunables::params::j2_minPageReadAhead,
  $j2_nPagesPerWriteBehindCluster = aix_kernel_tunables::params::j2_nPagesPerWriteBehindCluster,
  $j2_nRandomCluster              = aix_kernel_tunables::params::j2_nRandomCluster,
  $j2_recoveryMode                = aix_kernel_tunables::params::j2_recoveryMode,
  $j2_syncPageCount               = aix_kernel_tunables::params::j2_syncPageCount,
  $j2_syncPageLimit               = aix_kernel_tunables::params::j2_syncPageLimit,
  $lvm_bufcnt                     = aix_kernel_tunables::params::lvm_bufcnt,
  $maxpgahead                     = aix_kernel_tunables::params::maxpgahead,
  $maxrandwrt                     = aix_kernel_tunables::params::maxrandwrt,
  $numclust                       = aix_kernel_tunables::params::numclust,
  $numfsbufs                      = aix_kernel_tunables::params::numfsbufs,
  $pd_npages                      = aix_kernel_tunables::params::pd_npages,
  $posix_aio_active               = aix_kernel_tunables::params::posix_aio_active,
  $posix_aio_maxreqs              = aix_kernel_tunables::params::posix_aio_maxreqs,
  $posix_aio_maxservers           = aix_kernel_tunables::params::posix_aio_maxservers,
  $posix_aio_minservers           = aix_kernel_tunables::params::posix_aio_minservers,
  $posix_aio_server_inactivity    = aix_kernel_tunables::params::posix_aio_server_inactivity,
  $spec_accessupdate              = aix_kernel_tunables::params::spec_accessupdate,
  $portcheck                      = aix_kernel_tunables::params::portcheck,
  $nfs_use_reserved_ports         = aix_kernel_tunables::params::nfs_use_reserved_ports,
  $sb_max                         = aix_kernel_tunables::params::sb_max,
  $sockthresh                     = aix_kernel_tunables::params::sockthresh,
  $clean_partial_conns            = aix_kernel_tunables::params::clean_partial_conns,
  $rfc1323                        = aix_kernel_tunables::params::rfc1323,
  $tcp_mssdflt                    = aix_kernel_tunables::params::tcp_mssdflt,
  $tcp_recvspace                  = aix_kernel_tunables::params::tcp_recvspace,
  $tcp_sendspace                  = aix_kernel_tunables::params::tcp_sendspace,
  $tcp_tcpsecure                  = aix_kernel_tunables::params::tcp_tcpsecure,
  $udp_sendspace                  = aix_kernel_tunables::params::udp_sendspace,
  $udp_recvspace                  = aix_kernel_tunables::params::udp_recvspace,
  $ipqmaxlen                      = aix_kernel_tunables::params::ipqmaxlen,
  $tcp_ephemeral_low              = aix_kernel_tunables::params::tcp_ephemeral_low,
  $tcp_ephemeral_high             = aix_kernel_tunables::params::tcp_ephemeral_low,
  $udp_ephemeral_low              = aix_kernel_tunables::params::udp_ephemeral_low,
  $udp_ephemeral_high             = aix_kernel_tunables::params::udp_ephemeral_high,
  $directed_broadcast             = aix_kernel_tunables::params::directed_broadcast,
  $ip6srcrouteforward             = aix_kernel_tunables::params::ip6srcrouteforward,
  $ipforwarding                   = aix_kernel_tunables::params::ipforwarding,
  $ipignoreredirects              = aix_kernel_tunables::params::ipignoreredirects,
  $ipsendredirects                = aix_kernel_tunables::params::ipsendredirects,
  $ipsrcrouteforward              = aix_kernel_tunables::params::ipsrcrouteforward,
  $ipsrcrouterecv                 = aix_kernel_tunables::params::ipsrcrouterecv,
  $ipsrcroutesend                 = aix_kernel_tunables::params::ipsrcroutesend,
  $nonlocsrcroute                 = aix_kernel_tunables::params::nonlocsrcroute,
  $bcastping                      = aix_kernel_tunables::params::bcastping,
  $icmpaddressmask                = aix_kernel_tunables::params::icmpaddressmask,
  $rtentry_lock_complex           = aix_kernel_tunables::params::rtentry_lock_complex, 
  $tcp_pmtu_discover              = aix_kernel_tunables::params::tcp_pmtu_discover,
  $udp_pmtu_discover              = aix_kernel_tunables::params::udp_pmtu_discover,
  $use_isno                       = aix_kernel_tunables::params::use_isno,
  $vpm_fold_policy                = aix_kernel_tunables::params::vpm_fold_policy,
  $vpm_xvcpus                     = aix_kernel_tunables::params::vpm_xvcpus,
  $lgpg_regions                   = aix_kernel_tunables::params::lgpg_regions,
  $lgpg_size                      = aix_kernel_tunables::params::lgpg_size, 
  $maxfree                        = aix_kernel_tunables::params::maxfree,
  $maxpin_pct                     = aix_kernel_tunables::params::maxpin_pct,
  $minfree                        = aix_kernel_tunables::params::minfree,
  $minperm_pct                    = aix_kernel_tunables::params::minperm_pct,
  $v_pinshm                       = aix_kernel_tunables::params::v_pinshm
)inherits aix_kernel_tunables::params {
  case $::kernelversion {
    '5300'  : {
    }
    default : {
      ioo { 'ioo_tunables':
      }
    }
  }

  nfso { 'nfso_tunables':
  }

  no { 'no_general_tunables':
  }

  no { 'no_tcp_tunables':
  }

  no { 'no_udp_tunables':
  }

  no { 'no_ip_tunables':
  }

  no { 'no_others_tunables':
  }

  schedo { 'schedo_tunables':
  }

  vmo { 'vmo_tunables':
  }
}
