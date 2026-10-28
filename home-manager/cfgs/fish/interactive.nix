{
  programs.fish = {
    interactiveShellInit = ''
      cat $XDG_CACHE_HOME/wallust/sequences

      set -U fish_prompt_pwd_dir_length 0
      set -U fish_color_param cyan

      set -g __fish_git_prompt_show_informative_status 1
      set -g __fish_git_prompt_showuntrackedfiles 1

      set -g __fish_git_prompt_color_branch magenta
      set -g __fish_git_prompt_showupstream informative
      set -g __fish_git_prompt_char_upstream_ahead "↑"
      set -g __fish_git_prompt_char_upstream_behind "↓"
      set -g __fish_git_prompt_char_upstream_prefix ""

      set -g __fish_git_prompt_char_stagedstate "●"
      set -g __fish_git_prompt_char_dirtystate "✚"
      set -g __fish_git_prompt_char_untrackedfiles "…"
      set -g __fish_git_prompt_char_conflictedstate "✖"
      set -g __fish_git_prompt_char_cleanstate "✔"

      set -g __fish_git_prompt_color_dirtystate blue
      set -g __fish_git_prompt_color_stagedstate yellow
      set -g __fish_git_prompt_color_invalidstate red
      set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
      set -g __fish_git_prompt_color_cleanstate green

      set -q VIRTUAL_ENV_DISABLE_PROMPT
      or set -g VIRTUAL_ENV_DISABLE_PROMPT true

      devenv hook fish | source
      eval $(batman --export-env)
    '';

    shellAliases =
      let
        flakeDir = "~/Dotfiles";
      in
      {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir} --impure";
        hrb = "home-manager switch --flake ${flakeDir} --impure";
        upd = "nix flake update --flake ${flakeDir}";
        upg = "rb && sleep 2 && hrb";
        rmcache = "sudo nix-collect-garbage -d && home-manager expire-generations '-1 mins' --flake ${flakeDir}";

        cl = "clear && smallfetch";
        clf = "clear && fastfetch";
        clear = "printf '\\033[2J\\033[H'";
        tremp = "trash-empty -f";
        smallfetch = "fastfetch --config $XDG_CONFIG_HOME/fastfetch/smallfetch.jsonc";
        o7 = "shutdown -h now";
        wf-test = "ping google.com -c 5";
      };
  };
}
