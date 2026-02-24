{ config, theme, ... }:
{
  wayland.windowManager.mango.settings = ''
    # Window effect
    blur=1
    blur_layer=1
    blur_optimized=1
    blur_params_num_passes = 2
    blur_params_radius = 10
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

    border_radius=${toString theme.borderRadius}
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


    # Overview Setting
    hotarea_size=10
    enable_hotarea=1
    ov_tab_mode=0
    overviewgappi=5
    overviewgappo=30
  '';
}
