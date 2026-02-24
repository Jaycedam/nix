_: {
  wayland.windowManager.mango.settings = ''
    # Key Bindings
    # key name refer to `xev` or `wev` command output,
    # mod keys name: super,ctrl,alt,shift,none

    # reload config
    binds=super+shift,r,reload_config

    # apps
    binds=super,space,spawn,fuzzel
    binds=super,t,spawn,kitty -1
    binds=super,b,spawn,brave
    binds=super,p,spawn,dmenu-power
    binds=super,e,spawn,kitty -1 --class yazi yazi
    binds=super,m,spawn,kitty -1 --class rmpc rmpc
    binds=super,n,spawn,kitty -1 --class nvim nvim
    binds=super,s,spawn,launch-webapp open.spotify.com
    binds=super,y,spawn,launch-webapp youtube.com
    binds=super,w,spawn,launch-webapp web.whatsapp.com
    binds=super+shift,m,spawn,launch-webapp mail.proton.me

    # exit
    binds=super+shift,q,quit
    binds=super,q,killclient,

    # switch window focus
    binds=super,tab,focusstack,next
    binds=super,left,focusdir,left
    binds=super,l,focusdir,right
    binds=super,h,focusdir,left
    binds=super,right,focusdir,right
    binds=super,up,focusdir,up
    binds=super,k,focusdir,up
    binds=super,down,focusdir,down
    binds=super,j,focusdir,down

    # swap window
    binds=super+shift,up,exchange_client,up
    binds=super+shift,k,exchange_client,up
    binds=super+shift,down,exchange_client,down
    binds=super+shift,j,exchange_client,down
    binds=super+shift,left,exchange_client,left
    binds=super+shift,h,exchange_client,left
    binds=super+shift,right,exchange_client,right
    binds=super+shift,l,exchange_client,right

    # switch window status
    binds=super,g,toggleglobal,
    binds=super,o,toggleoverview,
    binds=super,v,togglefloating,
    binds=super,f,togglemaximizescreen,
    binds=super+shift,f,togglefullscreen,
    binds=alt+shift,f,togglefakefullscreen,
    binds=super,i,minimized,
    binds=super+shift,o,toggleoverlay,
    binds=super+shift,i,restore_minimized
    binds=super,z,toggle_scratchpad

    # scroller layout
    binds=super,a,set_proportion,1.0
    binds=super,r,switch_proportion_preset,

    # switch layout
    binds=super+shift,n,switch_layout

    # tag switch
    # bind=super,left,viewtoleft,0
    bind=ctrl,left,viewtoleft_have_client,0
    bind=ctrl,h,viewtoleft_have_client,0
    # bind=super,right,viewtoright,0
    bind=ctrl,right,viewtoright_have_client,0
    bind=ctrl,l,viewtoright_have_client,0
    # bind=ctrl+super,left,tagtoleft,0
    # bind=ctrl+super,right,tagtoright,0

    binds=super,1,view,1,0
    binds=super,2,view,2,0
    binds=super,3,view,3,0
    binds=super,4,view,4,0
    binds=super,5,view,5,0
    binds=super,6,view,6,0
    binds=super,7,view,7,0
    binds=super,8,view,8,0
    binds=super,9,view,9,0

    # tag: move client to the tag and focus it
    # tagsilent: move client to the tag and not focus it
    # bind=alt,1,tagsilent,1
    bind=super+shift,1,tag,1,0
    bind=super+shift,2,tag,2,0
    bind=super+shift,3,tag,3,0
    bind=super+shift,4,tag,4,0
    bind=super+shift,5,tag,5,0
    bind=super+shift,6,tag,6,0
    bind=super+shift,7,tag,7,0
    bind=super+shift,8,tag,8,0
    bind=super+shift,9,tag,9,0

    bind=ctrl+shift,1,toggleview,1,0
    bind=ctrl+shift,2,toggleview,2,0
    bind=ctrl+shift,3,toggleview,3,0
    bind=ctrl+shift,4,toggleview,4,0
    bind=ctrl+shift,5,toggleview,5,0
    bind=ctrl+shift,6,toggleview,6,0
    bind=ctrl+shift,7,toggleview,7,0
    bind=ctrl+shift,8,toggleview,8,0
    bind=ctrl+shift,9,toggleview,9,0

    # monitor switch
    # bind=alt+shift,left,focusmon,left
    # bind=alt+shift,right,focusmon,right
    # bind=super+alt,left,tagmon,left
    # bind=super+alt,right,tagmon,right

    # gaps
    # bind=alt+shift,X,incgaps,1
    # bind=alt+shift,Z,incgaps,-1
    # bind=super+shift,g,togglegaps

    # movewin
    bind=ctrl+shift,up,movewin,+0,-50
    bind=ctrl+shift,down,movewin,+0,+50
    bind=ctrl+shift,left,movewin,-50,+0
    bind=ctrl+shift,right,movewin,+50,+0

    # resizewin
    bind=super+shift,minus,resizewin,+0,-50
    bind=super+shift,equal,resizewin,+0,+50
    bind=super,minus,resizewin,-50,+0
    bind=super,equal,resizewin,+50,+0

    # brightness
    bind=none,XF86MonBrightnessUp,spawn,brightness up
    bind=none,XF86MonBrightnessDown,spawn,brightness down
    # keyboard backlight
    bind=shift,XF86MonBrightnessUp,spawn,brightnessctl -q -d kbd_backlight s +25%
    bind=shift,XF86MonBrightnessDown,spawn,brightnessctl -q -d kbd_backlight s 25%-
    # volume
    bind=none,XF86AudioRaiseVolume,spawn,volume up
    bind=none,XF86AudioLowerVolume,spawn,volume down
    bind=none,XF86AudioMute,spawn,volume mute

    # playerctl
    bind=none,XF86AudioPlay,spawn,playerctl play-pause
    bind=none,XF86AudioStop,spawn,playerctl stop
    bind=none,XF86AudioPrev,spawn,playerctl previous
    bind=none,XF86AudioNext,spawn,playerctl next
  '';
}
