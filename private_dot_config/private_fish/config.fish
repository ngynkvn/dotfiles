# NOTE: conf.d is sourced first

set -x EDITOR nvim

type -q pnpm; and set -x PNPM_HOME "$HOME/.local/share/pnpm"; and fish_add_path $PNPM_HOME

set -x BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

test -e "$HOME/.cargo/env.fish"; and source "$HOME/.cargo/env.fish"

set --export ZVM_INSTALL "$HOME/.zvm/self"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$ZVM_INSTALL"

EMSDK_QUIET=1 type -q ~/dev/source/emsdk/emsdk_env.fish; and source ~/dev/source/emsdk/emsdk_env.fish

set fish_greeting
if status is-interactive
    if command -v zoxide &>/dev/null
        zoxide init fish --cmd cd | source
    end
    if command -v fzf &>/dev/null
        set FZF_CTRL_R_COMMAND ''
        fzf --fish | source
    end

    if command -v atuin &>/dev/null
        set -x ATUIN_NOBIND true
        atuin init fish | source
        # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
        bind \cr _atuin_search
        bind -M insert \cr _atuin_search
    end
    if command -v batman &>/dev/null
        batman --export-env | source
    end
    set -a MANPATH /Users/ngynkvn/.local/share/man
    if not status is-login
        fish_default_key_bindings
    end
end

fish_add_path $HOME/.cache/lm-studio/bin
