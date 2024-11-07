
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
test -e "$HOME/.cargo/env.fish"; and source "$HOME/.cargo/env.fish" # For fish

# python 
# NOTE: use `uv` now
# type -q pyenv; and pyenv init - | source

# Zig
set --export ZVM_INSTALL "$HOME/.zvm/self"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$ZVM_INSTALL"

#?
#set -Ux PLAN9 /usr/local/plan9
#fish_add_path --append "$PLAN9/bin"
EMSDK_QUIET=1 type -q ~/dev/source/emsdk/emsdk_env.fish; and source ~/dev/source/emsdk/emsdk_env.fish

if status is-interactive
    set fish_greeting
    if command -v zoxide &>/dev/null
        zoxide init fish --cmd cd | source
    end
    if command -v fzf &>/dev/null
        fzf --fish | source
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
    set -a MANPATH /Users/ngynkvn/.local/share/man
end
