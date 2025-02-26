abbr --add -- zbr 'zig build run'
abbr -a -- zb 'zig build'
abbr -a -- fsrc 'cd (fd -td -H \'\.git$\' ~/ghq --prune -0 | xargs -0 dirname | fzf)'
abbr -a -- cr 'cargo run'

abbr --add -- hfc 'huggingface-cli download --local-dir ~/.local/llama.cpp/models/'

function _git_clone_src
    echo begin
    echo set repo_url %
    echo set -q repo_url[1]; or return
    echo 'git clone "$repo_url" $HOME/dev/source/$(basename -s .git $repo_url)'
    echo end
end
abbr --add dls --set-cursor --function _git_clone_src

# This first creates a function last_history_item which outputs the last entered command. It then
# adds an abbreviation which replaces !! with the result of calling this function. Taken together,
# this is similar to the !! history expansion feature of bash.
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# with a "le" abbr
# E.g. `git cless<SPACE>` turns into `git --color=always | less -R --quit-if-one-screen
# with the cursor in front of the pipe
function le
    # Abbr. Try to add a "--color=always" option and pipe to less.
    # If we don't recognize the command, we still pipe to less.
    # (alternative is to write an empty string and return 0 to eliminate the abbr key)
    set -l tok (commandline -opc)
    # Remove the abbr itself
    set -e tok[-1]
    while contains -- $tok[1] and or not command builtin
        set -e tok[1]
    end

    if not set -q tok[1]
        echo %
        return
    end

    set -l opt
    switch "$tok[1]"
        case grep rg
            # TODO: Check for gnu version
            set opt --json
        case diff ls
            # TODO: Check for gnu version
            set opt --color=always
        case jq
            set opt -C
        case g++{,'-*'} gcc{,-'*'}
            set opt -fdiagnostics-color=always
        case git
            # it's git, we need to figure out the subcommand
            set -l optspecs version h/help C= c=+ 'e-exec-path=?' html-path man-path info-path p/paginate \
                P/no-pager no-replace-objects bare git-dir= work-tree= namespace= super-prefix= \
                literal-pathspecs glob-pathspecs noglob-pathspecs icase-pathspecs
            if not argparse -s $optspecs -- $tok[2..] 2>/dev/null
                set opt
                # at least log and grep won't use options after the first nonopt
                # so we just give up parsing it
            else if set -q argv[2]
                and contains -- $argv[1] log grep
                set opt
            else
                set opt --color=always
            end
        case '*'
            set opt
    end

    # -- argument, can't give an option
    if contains -- -- $tok
        set opt
    end

    set -l pager less
    set -q PAGER
    and echo -- $PAGER | read -lat pager
    if not type -q $pager[1]
        echo %
        return
    end

    # We print our color option, then the cursor position,
    # and then the pager - even if we don't otherwise recognize the command
    echo -- $opt % "| $pager"
end

abbr --add le --function le --set-cursor --position anywhere
abbr -a -- gmt 'go mod tidy'
