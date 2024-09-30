if status is-interactive
end

# replaced by `fisher install kidonng/zoxide.fish`
# zoxide init --cmd cd fish | source

## OSX ##
type -q brew; or if test -e /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
    test -d (brew --prefix)"/share/fish/completions"; and set -p fish_complete_path (brew --prefix)/share/fish/completions
    test -d (brew --prefix)"/share/fish/vendor_completions.d"; and set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# pnpm
type -q pnpm; and set -gx PNPM_HOME "$HOME/.local/share/pnpm"; and set -gx PATH "$PNPM_HOME" $PATH
source "$HOME/.cargo/env.fish" # For fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# rust
source "$HOME/.cargo/env.fish" # For fish

# python
type -q pyenv; and pyenv init - | source
# Alt-e for directory search
fzf_configure_bindings --directory=\e`

set fish_greeting
set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --preview="_fzf_preview_file {}"'

# Zig
set --export ZVM_INSTALL "$HOME/.zvm/self"
fish_add_path "$HOME/.zvm/bin"
fish_add_path "$ZVM_INSTALL"
