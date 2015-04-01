CX61 Config
===========

On CX61, sound and video does not work properly unless you tweak some configuration files.  

User Sound configuration
------------------------

It seems that alsa choose the wrong device (aplay -l)  
```
cp asoundrc ~/.asoundrc
```

Xorg Video configuration
------------------------

Since cx61 have two video card (NVIDIA 820M and Intel 4th Gen HD Graphic) you need to provide a custom xorg.conf  
```
cp xorg.conf /etc/X11/xorg.conf
```

also in your .xinitrc add this lines at the beginning:  
```
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
```
