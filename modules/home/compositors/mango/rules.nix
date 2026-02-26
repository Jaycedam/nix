_: {
  wayland.windowManager.mango.settings = ''
    # monitor rules
    # monitorrule=name:Values,Parameter:Values,Parameter:Values
    monitorrule=name:eDP-1,scale:1.7
    # monitorrule=name:HDMI-A-1,width:1920,height:1080,refresh:71.91

    # layout support:
    circle_layout=tile,scroller
    # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
    tagrule=id:1,layout_name:tile
    tagrule=id:2,layout_name:tile
    tagrule=id:3,layout_name:tile
    tagrule=id:4,layout_name:tile
    tagrule=id:5,layout_name:tile
    tagrule=id:6,layout_name:tile
    tagrule=id:7,layout_name:tile
    tagrule=id:8,layout_name:tile
    tagrule=id:9,layout_name:tile

    # layer rule
    layerrule=animation_type_open:zoom,layer_name:launcher
    layerrule=animation_type_close:zoom,layer_name:launcher
    layerrule=animation_type_open:fade,layer_name:notifications
    layerrule=animation_type_close:fade,layer_name:notifications

    # window rule
    windowrule=tags:1,appid:brave-browser
    windowrule=tags:2,appid:kitty
    windowrule=tags:3,appid:brave-open.spotify.com__-Default
    windowrule=tags:3,appid:brave-youtube.com__-Default
    windowrule=tags:4,appid:brave-web.whatsapp.com__-Default
    windowrule=tags:4,appid:brave-web.mail.proton.me__-Default
    windowrule=tags:5,appid:steam
    # pip
    windowrule=width:400,height:225,isfloating:1,isglobal:1,isoverlay:1,offsetx:100,offsety:-100,noblur:1,isnoborder:1,unfocused_opacity:1,title:Picture in picture
  '';
}
