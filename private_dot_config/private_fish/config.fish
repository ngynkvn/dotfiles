if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/ngynkvn/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
zoxide init --cmd cd fish | source
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
