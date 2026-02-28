_: {
  wayland.windowManager.mango.settings = ''
    # keyboard
    repeat_rate=25
    repeat_delay=600
    numlockon=0
    xkb_rules_layout=us,us
    xkb_rules_variant=colemak_dh_iso
    xkb_rules_options=caps:escape

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

    # Mouse Button Bindings
    # btn_left and btn_right can't bind none mod key
    mousebind=super,btn_left,moveresize,curmove
    mousebind=NONE,btn_middle,togglemaximizescreen,0
    mousebind=super,btn_right,moveresize,curresize

    # 3-finger: Workspace navigation, niri like gestures
    gesturebind=none,right,3,focusdir,left
    gesturebind=none,left,3,focusdir,right
    gesturebind=none,down,3,viewtoleft_have_client
    gesturebind=none,up,3,viewtoright_have_client

    # Axis Bindings
    axisbind=super,UP,viewtoleft_have_client
    axisbind=super,DOWN,viewtoright_have_client
  '';
}
