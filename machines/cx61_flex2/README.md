MSI CX61/Lenovo Flex2 Config
=================

On CX61/Flex2, sound and video does not work properly unless you tweak some configuration files.  

User Sound configuration
------------------------

It seems that alsa choose the wrong device (aplay -l)  
```
cp asoundrc ~/.asoundrc
```
note: please also add it to root account for acpi script to work

Xorg Video configuration
------------------------

Since cx61/Flex2 have two video card (NVIDIA 820M and Intel 4th Gen HD Graphic) you need to provide a custom xorg.conf  
```
cp xorg.conf /etc/X11/xorg.conf
```
Please use the following command to find the corect PCI Bus (and fix xorg.conf accordingly)
```
lspci | grep -E "VGA|3D"
```

also in your .xinitrc add this lines at the beginning:  
```
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
```
