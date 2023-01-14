---
sidebar_label: 'Setup'
sidebar_position: 2
---
<head>
  <title>FMADIO | MD-Gap Setup</title>
</head>



# Setup Configuration #

1) download the LXC
2) untar the lxc into /opt/fmadio/lxc/
3) symlink  mdgap-YYYMMDD -> mdgap
4) run the install script
5) select the number of rings to use for MD gap
6) start the container
7) use systemctl to enable/start specific protocols to use

```
root@mdgap-20220927:/etc/systemd/system# systemctl status fmadio-mdgap*
* fmadio-mdgap-cme_mdp3_v1.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-cme_mdp3_v1.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap-eurex_eobi_v9.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-eurex_eobi_v9.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap-nasdaq_itch_v5.service - FMADIO Market Data Gap Detection (Nasdaq.Equities.TotalView.Itch.v5.0.h)
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-nasdaq_itch_v5.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap-siac_cqs_v1.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-siac_cqs_v1.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap-siac_cts_v1.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-siac_cts_v1.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap-siac_opra_v4.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap-siac_opra_v4.service; disabled; vendor preset: disabled)
   Active: inactive (dead)

* fmadio-mdgap.service - FMADIO Market Data Gap Detection
   Loaded: loaded (/etc/systemd/system/fmadio-mdgap.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
root@mdgap-20220927:/etc/systemd/system#

```

8) configure push_pcap to filter and output data to each ring
