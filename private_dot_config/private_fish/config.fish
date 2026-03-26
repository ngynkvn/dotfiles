# NOTE: conf.d is sourced first

set -x EDITOR nvim

type -q pnpm \
    && set -x PNPM_HOME "$HOME/.local/share/pnpm" \
    && fish_add_path $PNPM_HOME

set -x BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

test -e "$HOME/.local/share/cargo/env.fish" \
    && source "$HOME/.local/share/cargo/env.fish"

set --export ZVM_INSTALL "$HOME/.zvm/self"
set --export MITM_SSLKEYLOGFILE "$HOME/.mitmproxy/sslkeys.log"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$ZVM_INSTALL"

EMSDK_QUIET=1 type -q ~/dev/source/emsdk/emsdk_env.fish \
    && source ~/dev/source/emsdk/emsdk_env.fish

# Wasmer
export WASMER_DIR="/Users/ngynkvn/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] \
    && source "$WASMER_DIR/wasmer.sh"

set --export CLIPPY_CONF_DIR '/Users/ngynkvn/.config/clippy'

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
        #bind alt-up _atuin_bind_up
    end
    if command -v batman &>/dev/null
        batman --export-env | source
    end
    set -a MANPATH '/Users/ngynkvn/.local/share/man'
    if not status is-login
        fish_default_key_bindings
    else
        # fish_hybrid_key_bindings
    end
end
bind ctrl-alt-x 'commandline -rt -- (commandline -xt | string escape | string join " ")'

# bun
set --export BUN_INSTALL "$HOME/.local/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Mole shell completion
set -l output (mole completion fish 2>/dev/null); and echo "$output" | source
