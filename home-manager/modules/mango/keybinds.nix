{ config, ... }: {
  wayland.windowManager.mango.settings = {
    bind = [
      "SUPER,1,comboview,1"
      "SUPER,2,comboview,2"
      "SUPER,3,comboview,3"
      "SUPER,4,comboview,4"
      "SUPER,5,comboview,5"
      "SUPER,6,comboview,6"
      "SUPER,7,comboview,7"
      "SUPER,8,comboview,8"
      "SUPER,9,comboview,9"
      "SUPER,0,toggle_special_tag"
      "SUPER+SHIFT,1,tag,1"
      "SUPER+SHIFT,2,tag,2"
      "SUPER+SHIFT,3,tag,3"
      "SUPER+SHIFT,4,tag,4"
      "SUPER+SHIFT,5,tag,5"
      "SUPER+SHIFT,6,tag,6"
      "SUPER+SHIFT,7,tag,7"
      "SUPER+SHIFT,8,tag,8"
      "SUPER+SHIFT,9,tag,9"
      "SUPER+SHIFT,0,tag_special_tag"
      "SUPER+ALT,1,toggletag,1"
      "SUPER+ALT,2,toggletag,2"
      "SUPER+ALT,3,toggletag,3"
      "SUPER+ALT,4,toggletag,4"
      "SUPER+ALT,5,toggletag,5"
      "SUPER+ALT,6,toggletag,6"
      "SUPER+ALT,7,toggletag,7"
      "SUPER+ALT,8,toggletag,8"
      "SUPER+ALT,9,toggletag,9"
      "SUPER,up,focusdir,up"
      "SUPER,down,focusdir,down"
      "SUPER,left,focusstack,prev"
      "SUPER,right,focusstack,next"
      "SUPER+SHIFT,up,exchange_client,up"
      "SUPER+SHIFT,down,exchange_client,down"
      "SUPER+SHIFT,left,exchange_stack_client,prev"
      "SUPER+SHIFT,right,exchange_stack_client,next"
      "SUPER,O,togglejump"
      "SUPER,Tab,spawn,wlr-switcher"
      "SUPER,Return,spawn,kitty --hold fastfetch -c ${config.xdg.configHome}/fastfetch/smallfetch.jsonc"

      "SUPER,Q,killclient"
      "SUPER+SHIFT,Q,quit"
      "SUPER+ALT,Q,spawn,shutdown -c now"

      "SUPER,W,switch_layout"

      "SUPER,E,spawn,wlr-draw on"
      "SUPER+SHIFT,E,spawn,wlr-draw visibility"
      "SUPER+ALT,E,spawn,wlr-draw clear"

      "SUPER,R,reload_config"
      "SUPER+SHIFT,R,spawn,systemctl soft-reboot"
      "SUPER+ALT,R,spawn,reboot"

      "SUPER,T,spawn,code"

      "SUPER+SHIFT,Y,spawn,$XDG_DATA_HOME/scripts/playerctl.py shuffle Toggle"
      "SUPER+ALT,Y,spawn_shell,$XDG_DATA_HOME/scripts/playerctl-toggle-loop"

      "SUPER,I,spawn,floorp"
      "SUPER+SHIFT,I,spawn,vesktop"
      "SUPER+ALT,I,spawn,ferdium"

      "SUPER,P,spawn,$XDG_DATA_HOME/scripts/playerctl.py play-pause"
      "SUPER+SHIFT,P,spawn,$XDG_DATA_HOME/scripts/playerctl.py stop"

      "SUPER,Bracketleft,spawn,$XDG_DATA_HOME/scripts/playerctl.py previous"
      "SUPER+SHIFT,Bracketleft,spawn_shell,$XDG_DATA_HOME/scripts/playerctl.py position 10-"
      "SUPER,Bracketright,spawn,$XDG_DATA_HOME/scripts/playerctl.py next"
      "SUPER+SHIFT,Bracketright,spawn_shell,$XDG_DATA_HOME/scripts/playerctl.py position 10+"

      "SUPER,A,spawn,rofi -show drun"
      "SUPER+SHIFT,A,spawn,select-wpp"
      "SUPER+ALT,A,spawn,select-cliphist"

      "SUPER,S,spawn,screenshot"
      "SUPER+SHIFT,S,spawn,screenshot -w"
      "SUPER+ALT,S,spawn,screenshot -o"

      "NONE,F8,spawn,screenshot -s"
      "SHIFT,F8,spawn,screenshot -w -s"
      "ALT,F8,spawn,screenshot -o -s"

      "SUPER,D,spawn,swaync-client --toggle-panel -sw"
      "SUPER+SHIFT,D,spawn,swaync-client --toggle-dnd -sw"
      "SUPER+ALT,D,spawn,swaync-client --clear-all -sw"

      "SUPER,F,togglefullscreen"
      "SUPER+SHIFT,F,togglefloating"
      "SUPER+ALT,F,togglefakefullscreen"

      "SUPER,G,spawn,nautilus"

      "SUPER,L,spawn,hyprlock"
      "SUPER+SHIFT,L,spawn,wleave"
      "SUPER+ALT,L,spawn,systemctl hibernate"

      "SUPER,V,spawn,screenrec"
      "SUPER+SHIFT,V,spawn,screenrec -w"
      "SUPER+ALT,V,spawn,screenrec -o"

      "SUPER,B,spawn,kitty --title bluetui bluetui"
      "SUPER,N,spawn,kitty --title impala impala"
      "SUPER,M,spawn,kitty --title rmpc rmpc"
      "SUPER+SHIFT,M,spawn,pkill -f mpris-monitor.py -USR1"
      "SUPER+ALT,M,spawn,pkill -f mpris-monitor.py -USR2"

      "NONE,F1,spawn,volumectl toggle-mute"
      "SHIFT,F1,spawn,volumectl -m toggle-mute"
      "NONE,F2,spawn,volumectl down"
      "SHIFT,F2,spawn,volumectl -m down"
      "NONE,F3,spawn,volumectl up"
      "SHIFT,F3,spawn,volumectl -m up"
      "NONE,F4,spawn,lightctl down"
      "NONE,F5,spawn,lightctl up"
    ];
    bindc = [
      "SUPER+SHIFT,W,switch_proportion_preset"
      "SUPER+SHIFT,W,incnmaster,+1"
      "SUPER+ALT,W,incnmaster,-1"
    ];
    mousebind = [
      "SUPER,btn_left,moveresize,curmove"
      "SUPER,btn_right,moveresize,curresize"
    ];
  };
}
