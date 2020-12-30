## Files to update
/boot/loader.conf
/etc/rc.conf
/etc/sysctl.conf
/etc/wpa_supplicant.conf

```console
REPO_PATH=/root/os-configuration/freebsd
```

## Internet Connectivity
```console
sysctl net.wlan.devices
cp ${REPO_PATH}/etc/wpa_supplicant.conf /etc/
cat >> /etc/rc.conf <<EOL
# Enable DHCP but don't let it block the boot process
background_dhclient="YES"

# Try to configure re0 (wired) on boot
ifconfig_igb0="DHCP"
wlans_rtwn0="wlan0"
ifconfig_wlan0="WPA SYNCDHCP"
EOL
service netif restart
```
Then change the `ssid` and `psk` to the proper values.

## Configure Ethernet to Wifi Failover
To configure in terminal:
```console
ifconfig lagg0 create
ifconfig lagg0 up laggproto failover laggport re0 laggport wlan0
```
or edit `/etc/rc.conf`
```console
cat >> /etc/rc.conf <<EOL
# Configure Ethernet to Wifi Failover
cloned_interfaces="lagg0"
ifconfig_lagg0="up laggproto failover laggport igb0 laggport wlan0"
EOL
```

## OS Update
```console
freebsd-update fetch
freebsd-update install
pkg update
pkg upgrade
```

## Install Stuff
```console
pkg install vim
pkg install git
pkg install vimfm
pkg install nnn
pkg install neofetch
pkg install xorg
pkg install compton
pkg install i3-gaps
pkg install i3blocks
pkg install rofi
pkg install nitrogen
pkg install rxvt-unicode
pkg install firefox
pkg install xfe

pkg install font-awesome
pkg install freecolor
pkg install yad
pkg install xkb-switch
```

## doas
```console
pkg install doas
touch /usr/local/etc/doas.conf

cat >> /usr/local/etc/doas.conf <<EOL
permit persist keepenv :wheel
permit nopass keepenv root as root
EOL

cat >> /root/.cshrc <<EOL
complete -cf doas
EOL
```

## Locale
Add to `/etc/login.conf` to `default:` lines
```console
  :charset=UTF-8: \                                                                                                       
  :lang=en_US.UTF-8:
```
Then run
```console
cap_mkdb /etc/login.conf
cat >> /etc/profile <<EOL

LANG=en_US.UTF-8;  export LANG
CHARSET=UTF-8;     export CHARSET
EOL
```

*TODO*: check man login.conf(5) setlocale(3)


## Sound Card
```console
cat /dev/sndstat
cat >> /etc/sysctl.conf <<EOL

# Set sound output
hw.snd.default_unit=6
EOL
```

## Graphic Card
```console
pciconf -lv
```
Find subclass = VGA. The `chip=0x67df1002` field contains `device_id=0x67df` and `vendor_id=0x1002`.
Find your `device_id` in you `/usr/local/share/pciids/pci.ids` file and add your device_id in AMD group when you can't find it in the file.

```console
pw groupmod video -m user
pkg install drm-stable-kmod
pkg install gpu-firmware-kmod
pkg install xf86-video-amdgpu
pkg install hal
cat >> /etc/rc.conf <<EOL
kld_list="amdgpu"
EOL
cat >> /boot/loader.conf <<EOL
hw.syscons.disable="1" 
kern.vty="vt"
EOL
cp ${REPO_PATH}/usr/local/etc/X11/xorg.conf.d/90-rog-pg278q.conf /usr/local/etc/X11/xorg.conf.d/
cp ${REPO_PATH}/usr/local/etc/X11/xorg.conf.d/20-amdgpu.conf /usr/local/etc/X11/xorg.conf.d/
```

## Access encrypted ZFS disk from Live-CD / Live-USB
Boot from USB into Multi-user and choose Live-CD, user `root`, no password.
```console
# Find device (e.g. nvd0) which has a partition named freebsd-zfs (among others like efi, freebsd-boot, freebsd-swap) and notice its number (e.g. 4)
gpart show
# Show only that device
gpart show nvd0
# Gain access to encrypted partition
geli attach /dev/nvd0p4
# Loadd zpool module
zpool import
# Create mount point
mkdir /tmp/mymnt
# mount zfs partition
zpool import -fa -R /tmp/mymnt
# Check for pools without mountpoint
zfs list
# Set non-conflicting mountpoints
zfs set mountpoint=/zroot/ROOT zroot/ROOT
zfs set mountpoint=/zroot/ROOT/default zroot/ROOT/default
# Try to mount everything (won't work for all)
zfs mount -a
# Mount missing parts, e.g.:
zfs mount zroot/ROOT/default
```

## Useful commands
sysctl net.wlan.devices
sysctl hw.snd.default_unit=7
service netif restart
usbconfig
freebsd-update fetch
freebsd-update install
pkg update
pkg upgrade
