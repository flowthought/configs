#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

# This command will inherit your X client configuration from the default
# Note: .XResources is your client config file, as opposed to .xserverrc
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set background image with feh
feh --bg-scale ~/downloads/sunset.jpg &

# The exec command does not fork
exec xmonad

# The below doesn't seem to work
# launch the external 60 second clock, and launch the workspace status bar
#FG='#a8a3f7'
#BG='#3f3c6d'
#xmonad-clock | dzen2 -e '' -x 400 -w 1200 -ta r -fg $FG -bg $BG &

#xmonad &

#wait for xmonad
#wait $!
#pkill -HUP dzen2
#pkill -HUP -f xmonad-clock
#wait

