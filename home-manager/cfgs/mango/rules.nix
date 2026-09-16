{
  wayland.windowManager.mango.settings = {
    monitorrule = [ "name:,scale:1.0,hdr:1,hdr_force:1,vrr:1" ];
    layerrule = [ "layer_name:swaync-control-center,noshadow:1" ];
    windowrule = [
      "appid:mpv,isfullscreen:1,focused_opacity:1,unfocused_opacity:1"
      "title:Picture-In-Picture,isfloating:1"
      "title:im-emoji-picker,isopensilent:1"
      "appid:org.fcitx.*,isfloating:1,width:1094,height:600"
      "appid:org.gnome.FileRoller,isfloating:1,width:1280,height:960"
      "appid:org.gnome.Nautilus,isfloating:1,width:1094,height:600"
      "appid:protonvpn-app,isfloating:1,width:800,height:600"
      "appid:viewnoir,isfloating:1,width:1280,height:720"
      "title:bluetui,isfloating:1,width:800,height:600"
      "title:btop,isfloating:1,width:1064,height:798"
      "title:impala,isfloating:1,width:800,height:600"
      "title:rmpc,isfloating:1,width:1280,height:960"
    ];
  };
}
