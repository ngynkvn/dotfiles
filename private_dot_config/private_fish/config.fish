# Trying to avoid having them inside nvim :|
if status is-login
    fish_vi_key_bindings
else
    fish_default_key_bindings
end
# pnpm
type -q pnpm; and set -gx PNPM_HOME "$HOME/.local/share/pnpm"; and set -gx PATH "$PNPM_HOME" $PATH

## OSX ##
type -q brew; or if test -e /opt/homebrew/bin/brew
    eval $(/opt/homebrew/bin/brew shellenv)
    test -d (brew --prefix)"/share/fish/completions"; and set -p fish_complete_path (brew --prefix)/share/fish/completions
    test -d (brew --prefix)"/share/fish/vendor_completions.d"; and set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:
type -q pyenv; and pyenv init - | source

set fish_greeting
