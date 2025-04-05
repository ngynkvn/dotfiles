function ghostty-edit
    argparse -n ghostty-edit -N 2 -- $argv || return
    set -l K $argv[1]
    set -l V $argv[2]
    set -l ghostty_config "$HOME/.config/ghostty/config"
    set -l count (rg --color=always "^$K" $ghostty_config | tee /dev/tty | wc -l)
    if test "$count" -ne 1
        echo "multiple matches, bailing"
        return 1
    end
    gsed -e "0,/^$K.*/s//$K = $V/" -i $ghostty_config && echo "$K = $V"
end
