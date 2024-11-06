if type -q direnv
    direnv hook fish | source
end
set -gx EDITOR nvim

# replaced by `fisher install kidonng/zoxide.fish`
# zoxide init --cmd cd fish | source

## OSX ##
type -q brew; or if test -e /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
    test -d (brew --prefix)"/share/fish/completions"; and set -p fish_complete_path (brew --prefix)/share/fish/completions
    test -d (brew --prefix)"/share/fish/vendor_completions.d"; and set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# pnpm
type -q pnpm; and set -gx PNPM_HOME "$HOME/.local/share/pnpm"; and set -gx PATH "$PNPM_HOME" $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rust
test -e "$CARGO_HOME/env.fish"; and source "$CARGO_HOME/env.fish" # For fish

# Zig
set --export ZVM_INSTALL "$HOME/.zvm/self"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$ZVM_INSTALL"

#?
#set -Ux PLAN9 /usr/local/plan9
#fish_add_path --append "$PLAN9/bin"
set -gx EMSDK_QUIET 1
test -e ~/dev/source/emsdk/emsdk_env.fish; and source ~/dev/source/emsdk/emsdk_env.fish

if status is-interactive
    set fish_greeting
    # Alt-q for directory search
    if type -q fzf_configure_bindings &>/dev/null
        fzf_configure_bindings --directory=\eq --history
    end

    if command -v atuin &>/dev/null
        set -gx ATUIN_NOBIND true
        atuin init fish | source
        # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
        bind \cr _atuin_search
        bind -M insert \cr _atuin_search
    end
    if command -v batman &>/dev/null
        batman --export-env | source
    end
end
