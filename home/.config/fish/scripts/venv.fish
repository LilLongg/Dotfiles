#!/usr/bin/fish

switch $argv[1]
    case list
        $HOME/.config/fish/scripts/vlist.nu
    case create
        uv venv --directory=$HOME/.venv $argv[2..] --relocatable
        set -l cur_dir (pwd)
        set -l new_venv (ls -t1 $HOME/.venv | head -n1)
        source $HOME/.venv/$new_venv/bin/activate.fish
        uv pip install -r $HOME/.config/python_defaults.txt
        deactivate
        cd $cur_dir
    case remove
        rm -rf $HOME/.venv/$argv[2]
    case activate
        set -l cur_dir (pwd)
        source $HOME/.venv/$argv[2]/bin/activate.fish
        cd $cur_dir
    case rename
        rm -rf $HOME/.venv/$argv[3]
        mv $HOME/.venv/$argv[2] $HOME/.venv/$argv[3]
    case deactivate
        # reset old environment variables
        if test -n "$_OLD_VIRTUAL_PATH"
            # https://github.com/fish-shell/fish-shell/issues/436 altered PATH handling
            if test (string sub -s 1 -l 1 $FISH_VERSION) -lt 3
                set -gx PATH (_fishify_path "$_OLD_VIRTUAL_PATH")
            else
                set -gx PATH $_OLD_VIRTUAL_PATH
            end
            set -e _OLD_VIRTUAL_PATH
        end

        if test -n "$_OLD_VIRTUAL_PYTHONHOME"
            set -gx PYTHONHOME "$_OLD_VIRTUAL_PYTHONHOME"
            set -e _OLD_VIRTUAL_PYTHONHOME
        end

        if test -n "$_OLD_FISH_PROMPT_OVERRIDE"
            and functions -q _old_fish_prompt
            # Set an empty local `$fish_function_path` to allow the removal of `fish_prompt` using `functions -e`.
            set -l fish_function_path

            # Erase virtualenv's `fish_prompt` and restore the original.
            functions -e fish_prompt
            functions -c _old_fish_prompt fish_prompt
            functions -e _old_fish_prompt
            set -e _OLD_FISH_PROMPT_OVERRIDE
        end

        set -e VIRTUAL_ENV
        set -e VIRTUAL_ENV_PROMPT

        if test "$argv[1]" != nondestructive
            # Self-destruct!
            functions -e pydoc
            functions -e deactivate
            functions -e _bashify_path
            functions -e _fishify_path
        end
end
