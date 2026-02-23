{ config, mango, ... }:
{
  imports = [
    mango.hmModules.mango
  ];
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      # More option see https://github.com/DreamMaoMao/mango/wiki/
      exec-once=~/.config/mango/autostart.sh

      # monitor rules
      # monitorrule=name:Values,Parameter:Values,Parameter:Values
      monitorrule=name:eDP-1,scale:1.7
      monitorrule=name:HDMI-A-1,refresh:72

      # Window effect
      blur=1
      blur_layer=1
      blur_optimized=1
      blur_params_num_passes = 2
      blur_params_radius = 5
      blur_params_noise = 0.02
      blur_params_brightness = 0.9
      blur_params_contrast = 0.9
      blur_params_saturation = 1.2

      shadows = 0
      layer_shadows = 0
      shadow_only_floating = 1
      shadows_size = 10
      shadows_blur = 15
      shadows_position_x = 0
      shadows_position_y = 0
      shadowscolor= 0x000000ff

      border_radius=10
      no_radius_when_single=0
      focused_opacity=1.0
      unfocused_opacity=0.8

      # Animation Configuration(support type:zoom,slide)
      # tag_animation_direction: 1-horizontal,0-vertical
      animations=1
      layer_animations=1
      animation_type_open=slide
      animation_type_close=slide
      animation_fade_in=1
      animation_fade_out=1
      tag_animation_direction=1
      zoom_initial_ratio=0.3
      zoom_end_ratio=0.8
      fadein_begin_opacity=0.5
      fadeout_begin_opacity=0.8
      animation_duration_move=500
      animation_duration_open=400
      animation_duration_tag=350
      animation_duration_close=800
      animation_duration_focus=0
      animation_curve_open=0.46,1.0,0.29,1
      animation_curve_move=0.46,1.0,0.29,1
      animation_curve_tag=0.46,1.0,0.29,1
      animation_curve_close=0.08,0.92,0,1
      animation_curve_focus=0.46,1.0,0.29,1
      animation_curve_opafadeout=0.5,0.5,0.5,0.5
      animation_curve_opafadein=0.46,1.0,0.29,1

      # Scroller Layout Setting
      scroller_structs=20
      scroller_default_proportion=0.8
      scroller_focus_center=0
      scroller_prefer_center=0
      edge_scroller_pointer_focus=1
      scroller_default_proportion_single=1.0
      scroller_proportion_preset=0.5,0.8,1.0

      # Master-Stack Layout Setting
      new_is_master=1
      default_mfact=0.55
      default_nmaster=1
      smartgaps=0

      # Overview Setting
      hotarea_size=10
      enable_hotarea=1
      ov_tab_mode=0
      overviewgappi=5
      overviewgappo=30

      # Misc
      no_border_when_single=0
      axis_bind_apply_timeout=100
      focus_on_activate=1
      idleinhibit_ignore_visible=0
      sloppyfocus=1
      warpcursor=1
      focus_cross_monitor=0
      focus_cross_tag=0
      enable_floating_snap=0
      snap_distance=30
      drag_tile_to_tile=1

      # keyboard
      repeat_rate=25
      repeat_delay=600
      numlockon=0
      xkb_rules_layout=us,us
      xkb_rules_variant=colemak_dh_iso,
      xkb_rules_options=grp:lalt_lshift_toggle,caps:escape

      # Trackpad
      # need relogin to make it apply
      disable_trackpad=0
      tap_to_click=0
      tap_and_drag=1
      drag_lock=1
      click_method=2
      trackpad_natural_scrolling=1
      disable_while_typing=1
      left_handed=0
      middle_button_emulation=0
      swipe_min_threshold=1

      # mouse
      # need relogin to make it apply
      mouse_natural_scrolling=0

      # Appearance
      gappih=10
      gappiv=10
      gappoh=10
      gappov=10
      scratchpad_width_ratio=0.8
      scratchpad_height_ratio=0.9
      borderpx=3
      rootcolor=0x${config.lib.stylix.colors.base00}ff
      bordercolor=0x${config.lib.stylix.colors.base03}ff
      focuscolor=0x${config.lib.stylix.colors.base0D}ff
      maximizescreencolor=0x${config.lib.stylix.colors.base0B}ff
      urgentcolor=0x${config.lib.stylix.colors.base08}ff
      scratchpadcolor=0x${config.lib.stylix.colors.base0C}ff
      globalcolor=0x${config.lib.stylix.colors.base0E}ff
      overlaycolor=0x${config.lib.stylix.colors.base0A}ff

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

      # Key Bindings
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none

      # reload config
      binds=super+shift,r,reload_config

      # apps
      binds=super,space,spawn,fuzzel
      binds=super,t,spawn,kitty
      binds=super,b,spawn,brave
      binds=super,p,spawn,dmenu-power
      binds=super,e,spawn,kitty --class yazi yazi
      binds=super,m,spawn,kitty --class rmpc rmpc
      binds=super,n,spawn,kitty --class nvim nvim
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

      # Mouse Button Bindings
      # btn_left and btn_right can't bind none mod key
      mousebind=super,btn_left,moveresize,curmove
      mousebind=NONE,btn_middle,togglemaximizescreen,0
      mousebind=super,btn_right,moveresize,curresize

      # 3-finger: Workspace navigation
      gesturebind=none,right,3,viewtoleft_have_client
      gesturebind=none,left,3,viewtoright_have_client
      gesturebind=none,down,3,toggleoverview
      gesturebind=none,up,3,toggleovervie

      # Axis Bindings
      axisbind=super,UP,viewtoleft_have_client
      axisbind=super,DOWN,viewtoright_have_client

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
    autostart_sh = ''
      # Note: here no need to add shebang
    '';
  };

}
