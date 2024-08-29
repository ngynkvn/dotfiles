if status is-interactive
    # Commands to run in interactive sessions can go here
end

# pnpm
if type -q pnpm
    set -gx PNPM_HOME "/home/ngynkvn/.local/share/pnpm"
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# replaced by `fisher install kidonng/zoxide.fish`
# zoxide init --cmd cd fish | source

if type -q /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
