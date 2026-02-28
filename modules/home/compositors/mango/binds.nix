_: {
  wayland.windowManager.mango.settings = ''
    # Key Bindings
    # key name refer to `xev` or `wev` command output,
    # mod keys name: super,ctrl,alt,shift,none

    # reload config
    binds=alt+shift,r,reload_config

    # apps
    binds=super,space,spawn,fuzzel
    binds=super,t,spawn,kitty
    binds=super,b,spawn,brave
    binds=super,p,spawn,dmenu-power
    binds=super,e,spawn,launch-tui yazi
    binds=super,m,spawn,launch-tui rmpc
    binds=super,n,spawn,launch-tui nvim -c lua Snacks.picker.projects()

    # webapps
    # TODO: add a script to focus if already open, missing ipc support from mango
    binds=super,s,spawn,launch-webapp open.spotify.com
    binds=super,y,spawn,launch-webapp youtube.com
    binds=super,w,spawn,launch-webapp web.whatsapp.com
    binds=super+shift,m,spawn,launch-webapp mail.proton.me

    # exit
    binds=super+shift,q,quit
    binds=super,q,killclient

    # switch window focus
    binds=super,tab,focusstack,next
    binds=super,left,focusdir,left
    binds=super,right,focusdir,right
    binds=super,up,focusdir,up
    binds=super,down,focusdir,down

    # swap window
    binds=super+shift,up,exchange_client,up
    binds=super+shift,down,exchange_client,down
    binds=super+shift,left,exchange_client,left
    binds=super+shift,right,exchange_client,right

    # switch window status
    binds=super,g,toggleglobal
    binds=super,o,toggleoverview
    binds=super,v,togglefloating
    binds=super,f,togglemaximizescreen
    binds=super+shift,f,togglefullscreen
    binds=alt+shift,f,togglefakefullscreen
    binds=super,i,minimized
    binds=super+shift,o,toggleoverlay
    binds=super+shift,i,restore_minimized
    binds=super,z,toggle_scratchpad

    # scroller layout
    binds=super,a,set_proportion,1.0
    binds=super,r,switch_proportion_preset

    # switch layout
    binds=super+shift,n,switch_layout

    # tag directional switch
    # options: viewtoleft, viewtoright, viewtoleft_have_client, viewtoright_have_client
    bind=ctrl+shift,up,viewtoleft_have_client,0
    bind=ctrl+shift,down,viewtoright_have_client,0

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

    # # movewin
    # bind=ctrl+shift,up,movewin,+0,-50
    # bind=ctrl+shift,down,movewin,+0,+50
    # bind=ctrl+shift,left,movewin,-50,+0
    # bind=ctrl+shift,right,movewin,+50,+0

    # brightness
    bindl=NONE,XF86MonBrightnessUp,spawn,brightness up
    bindl=NONE,XF86MonBrightnessDown,spawn,brightness down
    # keyboard backlight
    bindl=shift,XF86MonBrightnessUp,spawn,brightnessctl -q -d kbd_backlight s +25%
    bindl=shift,XF86MonBrightnessDown,spawn,brightnessctl -q -d kbd_backlight s 25%-
    # volume
    bindl=NONE,XF86AudioRaiseVolume,spawn,volume up
    bindl=NONE,XF86AudioLowerVolume,spawn,volume down
    bindl=NONE,XF86AudioMute,spawn,volume mute
    # playerctl
    bindl=NONE,XF86AudioPlay,spawn,playerctl play-pause
    bindl=NONE,XF86AudioStop,spawn,playerctl stop
    bindl=NONE,XF86AudioPrev,spawn,playerctl previous
    bindl=NONE,XF86AudioNext,spawn,playerctl next

    # Enter 'resize' mode
    binds=super+shift,r,setkeymode,resize
    keymode=resize
    bind=NONE,left,resizewin,-50,0
    bind=NONE,right,resizewin,50,0
    bind=NONE,down,resizewin,0,+50
    bind=NONE,up,resizewin,0,-50
    binds=NONE,escape,setkeymode,default

  '';
}
