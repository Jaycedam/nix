{
  inputs,
  config,
  theme,
  ...
}:
{
  imports = [
    inputs.mangowc.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    autostart_sh = "#"; # needed, don't remove
    settings = {
      # More option see https://github.com/DreamMaoMao/mango/wiki/
      # Misc
      # focus_on_activate = 0; # TODO: disable for games
      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      idleinhibit_ignore_visible = 0;
      sloppyfocus = 1;
      warpcursor = 1;
      focus_cross_monitor = 0;
      focus_cross_tag = 0;
      enable_floating_snap = 0;
      snap_distance = 30;
      drag_tile_to_tile = 1;

      # Appearance
      # Window effect
      blur = 1;
      blur_layer = 1;
      blur_optimized = 1;
      blur_params_num_passes = 2;
      blur_params_radius = 10;
      blur_params_noise = 0.02;
      blur_params_brightness = 0.9;
      blur_params_contrast = 0.9;
      blur_params_saturation = 1.2;

      shadows = 0;
      layer_shadows = 0;
      shadow_only_floating = 1;
      shadows_size = 10;
      shadows_blur = 15;
      shadows_position_x = 0;
      shadows_position_y = 0;
      shadowscolor = "0x000000ff";

      border_radius = "${toString theme.border-radius}";
      no_radius_when_single = 0;
      focused_opacity = 1.0;
      unfocused_opacity = 0.8;

      # Animation Configuration(support type:zoom,slide)
      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 1; # 1-horizontal,0-vertical
      zoom_initial_ratio = 0.3;
      zoom_end_ratio = 0.8;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;
      animation_duration_move = 500;
      animation_duration_open = 400;
      animation_duration_tag = 350;
      animation_duration_close = 800;
      animation_duration_focus = 0;
      animation_curve_open = "0.46,1.0,0.29,1";
      animation_curve_move = "0.46,1.0,0.29,1";
      animation_curve_tag = "0.46,1.0,0.29,1";
      animation_curve_close = "0.08,0.92,0,1";
      animation_curve_focus = "0.46,1.0,0.29,1";
      animation_curve_opafadeout = "0.5,0.5,0.5,0.5";
      animation_curve_opafadein = "0.46,1.0,0.29,1";

      # Appearance
      gappih = 10;
      gappiv = 10;
      gappoh = 10;
      gappov = 10;
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;
      borderpx = 2;
      rootcolor = "0x${config.lib.stylix.colors.base00}ff";
      bordercolor = "0x${config.lib.stylix.colors.base03}ff";
      focuscolor = "0x${config.lib.stylix.colors.base0D}ff";
      maximizescreencolor = "0x${config.lib.stylix.colors.base0B}ff";
      urgentcolor = "0x${config.lib.stylix.colors.base08}ff";
      scratchpadcolor = "0x${config.lib.stylix.colors.base0C}ff";
      globalcolor = "0x${config.lib.stylix.colors.base0E}ff";
      overlaycolor = "0x${config.lib.stylix.colors.base0A}ff";

      # Overview Setting
      hotarea_size = 10;
      enable_hotarea = 0;
      ov_tab_mode = 0;
      overviewgappi = 5;
      overviewgappo = 30;

      ## BINDS
      # key name refer to `xev` or `wev` command output,
      # mod keys name: super,ctrl,alt,shift,none
      binds = [
        "alt+shift,r,reload_config"
        # apps
        "super,space,spawn,fuzzel"
        "super,t,spawn,kitty"
        "super,b,spawn,brave"
        "super,p,spawn,dmenu-power"
        "super,e,spawn,launch-tui yazi"
        "super,m,spawn,launch-tui rmpc"
        # webapps
        "super,s,spawn,launch-webapp open.spotify.com"
        "super,y,spawn,launch-webapp youtube.com"
        "super,w,spawn,launch-webapp web.whatsapp.com"
        "super+shift,m,spawn,launch-webapp mail.proton.me"
        # exit
        "super+shift,q,quit"
        "super,q,killclient"
        # switch window focus
        "super,tab,focusstack,next"
        "super,left,focusdir,left"
        "super,right,focusdir,right"
        "super,up,focusdir,up"
        "super,down,focusdir,down"
        # swap window
        "super+shift,up,exchange_client,up"
        "super+shift,down,exchange_client,down"
        "super+shift,left,exchange_client,left"
        "super+shift,right,exchange_client,right"
        # switch window status
        "super,g,toggleglobal"
        "super,o,toggleoverview"
        "super,v,togglefloating"
        "super,f,togglemaximizescreen"
        "super+shift,f,togglefullscreen"
        "alt+shift,f,togglefakefullscreen"
        "super,i,minimized"
        "super+shift,o,toggleoverlay"
        "super+shift,i,restore_minimized"
        "super,z,toggle_scratchpad"
        # scroller layout
        "super,a,set_proportion,1.0"
        "super,r,switch_proportion_preset"
        # switch layout
        "super+shift,n,switch_layout"
      ];

      bind = [
        "super,1,view,1,0"
        "super,2,view,2,0"
        "super,3,view,3,0"
        "super,4,view,4,0"
        "super,5,view,5,0"
        "super,6,view,6,0"
        "super,7,view,7,0"
        "super,8,view,8,0"
        "super,9,view,9,0"

        # tag: move client to the tag and focus it
        # tagsilent: move client to the tag and not focus it
        # alt,1,tagsilent,1
        "super+shift,1,tag,1,0"
        "super+shift,2,tag,2,0"
        "super+shift,3,tag,3,0"
        "super+shift,4,tag,4,0"
        "super+shift,5,tag,5,0"
        "super+shift,6,tag,6,0"
        "super+shift,7,tag,7,0"
        "super+shift,8,tag,8,0"
        "super+shift,9,tag,9,0"

        "ctrl+shift,1,toggleview,1,0"
        "ctrl+shift,2,toggleview,2,0"
        "ctrl+shift,3,toggleview,3,0"
        "ctrl+shift,4,toggleview,4,0"
        "ctrl+shift,5,toggleview,5,0"
        "ctrl+shift,6,toggleview,6,0"
        "ctrl+shift,7,toggleview,7,0"
        "ctrl+shift,8,toggleview,8,0"
        "ctrl+shift,9,toggleview,9,0"

        # tag directional switch
        # options: viewtoleft, viewtoright, viewtoleft_have_client, viewtoright_have_client
        "super+ctrl,left,viewtoleft_have_client,0"
        "super+ctrl,right,viewtoright_have_client,0"

        # resize
        "super,minus,resizewin,-50,0"
        "super,equal,resizewin,50,0"
        "super+shift,equal,resizewin,0,+50"
        "super+shift,minus,resizewin,0,-50"
      ];

      bindl = [
        # brightness
        "NONE,XF86MonBrightnessUp,spawn,brightness up"
        "NONE,XF86MonBrightnessDown,spawn,brightness down"
        # keyboard backlight
        "shift,XF86MonBrightnessUp,spawn,brightnessctl -q -d kbd_backlight s +25%"
        "shift,XF86MonBrightnessDown,spawn,brightnessctl -q -d kbd_backlight s 25%-"
        # volume
        "NONE,XF86AudioRaiseVolume,spawn,volume up"
        "NONE,XF86AudioLowerVolume,spawn,volume down"
        "NONE,XF86AudioMute,spawn,volume mute"
        # playerctl
        "NONE,XF86AudioPlay,spawn,playerctl play-pause"
        "NONE,XF86AudioStop,spawn,playerctl stop"
        "NONE,XF86AudioPrev,spawn,playerctl previous"
        "NONE,XF86AudioNext,spawn,playerctl next"
      ];
      ## INPUT
      # keyboard
      repeat_rate = 25;
      repeat_delay = 600;
      numlockon = 0;
      xkb_rules_layout = "us";
      xkb_rules_variant = "colemak_dh_iso";
      xkb_rules_options = "caps:escape";

      # Trackpad
      # need relogin to make it apply
      disable_trackpad = 0;
      tap_to_click = 0;
      tap_and_drag = 1;
      drag_lock = 1;
      click_method = 2;
      trackpad_natural_scrolling = 1;
      disable_while_typing = 1;
      left_handed = 0;
      middle_button_emulation = 0;
      swipe_min_threshold = 1;

      # mouse
      # need relogin to make it apply
      mouse_natural_scrolling = 0;

      # Mouse Button Bindings
      # btn_left and btn_right can't bind none mod key
      mousebind = [
        "super,btn_left,moveresize,curmove"
        "super,btn_middle,togglemaximizescreen,0"
        "super,btn_right,moveresize,curresize"
      ];

      # 3-finger: Workspace navigation
      gesturebind = [
        "none,right,4,focusdir,left"
        "none,left,4,focusdir,right"
        "none,right,3,viewtoleft_have_client"
        "none,left,3,viewtoright_have_client"
      ];

      # Axis Bindings
      axisbind = [
        "super,UP,viewtoleft_have_client"
        "super,DOWN,viewtoright_have_client"
      ];

      ## LAYOUT
      # Scroller Layout Setting
      scroller_structs = 20;
      scroller_default_proportion = 0.8;
      scroller_focus_center = 0;
      scroller_prefer_center = 0;
      edge_scroller_pointer_focus = 1;
      scroller_default_proportion_single = 1.0;
      scroller_proportion_preset = "0.5,0.8,1.0";

      # Master-Stack Layout Setting
      new_is_master = 1;
      default_mfact = 0.55;
      default_nmaster = 1;
      smartgaps = 0;

      ## RULES
      # monitor rules
      # monitorrule=name:Values,Parameter:Values,Parameter:Values
      monitorrule = [
        "name:eDP-1,scale:1.7"
        "name:HDMI-A-1,width:1920,height:1080,refresh:72"
      ];

      # layout support:
      circle_layout = "tile,scroller";
      # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:tile"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      # layer rule
      layerrule = [
        "animation_type_open:zoom,layer_name:launcher"
        "animation_type_close:zoom,layer_name:launcher"
        "animation_type_open:fade,layer_name:notifications"
        "animation_type_close:fade,layer_name:notifications"
      ];

      # window rule
      windowrule = [
        "tags:1,appid:brave-browser"
        "tags:1,appid:brave-youtube.com__-Default"
        "tags:2,appid:kitty"
        "tags:2,appid:nvim"
        "tags:3,appid:brave-open.spotify.com__-Default"
        "tags:4,appid:brave-web.whatsapp.com__-Default"
        "tags:4,appid:brave-web.mail.proton.me__-Default"
        "tags:5,appid:steam"
        # floating global window (settings)
        "width:1000,height:800,isfloating:1,offsetx:0,offsety:0,isglobal:1,isoverlay=1,appid:impala$"
        "width:1000,height:800,isfloating:1,offsetx:0,offsety:0,isglobal:1,isoverlay=1,appid:bluetui$"
        "width:1000,height:800,isfloating:1,offsetx:0,offsety:0,isglobal:1,isoverlay=1,appid:org.pulseaudio.pavucontrol"
        # pip
        "width:400,height:225,isfloating:1,isglobal:1,isoverlay:1,offsetx:100,offsety:-100,noblur:1,isnoborder:1,unfocused_opacity:1,title:Picture in picture"
      ];

    };
  };

}
