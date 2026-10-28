{
  wayland.windowManager.mango.settings = {
    monitor_rule = [ "name:,scale:1.0,hdr:1,hdr_force:1,vrr:1" ];
    tag_rule = [ "id:*,layout_name:monocle" ];
    window_rule = [
      "app_id:mpv,is_fullscreen:1,focused_opacity:1,unfocused_opacity:1"
      "app_id:floorp,focused_opacity:1,unfocused_opacity:1"
      "title:Picture-in-Picture,is_floating:1,is_open_silent:1,no_force_center:1,width:500,height:300,offset_y:100"
      "title:im-emoji-picker,is_open_silent:1"
      "app_id:org.fcitx.*,is_floating:1,width:1094,height:600"
      "app_id:org.gnome.FileRoller,is_floating:1,width:1280,height:960"
      "app_id:org.gnome.Nautilus,is_floating:1,width:1094,height:600"
      "app_id:protonvpn-app,is_floating:1,width:800,height:600"
      "app_id:viewnoir,is_floating:1,width:1280,height:720"
      "app_id:xdg-desktop-portal-gtk,is_floating:1,width:1094,height:600"
      "title:bluetui,is_floating:1,width:800,height:600"
      "title:btop,is_floating:1,width:1064,height:798"
      "title:impala,is_floating:1,width:800,height:600"
      "title:rmpc,is_floating:1,width:1280,height:960"
    ];
  };
}
