# This first creates a function last_history_item which outputs the last entered command. It then
# adds an abbreviation which replaces !! with the result of calling this function. Taken together,
# this is similar to the !! history expansion feature of bash.
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

abbr --add -- zbr 'zig build run'
abbr -a -- zb 'zig build'

abbr -a -- cr 'cargo run'
abbr -a -- cb 'cargo build'

abbr -a -- gr 'go run '
abbr -a -- gm 'go mod tidy'

abbr -a -- fzfp 'fzf --preview \'bat --color=always {}\' --preview-window \'~3\''

abbr -a -- jjd 'jj log'
abbr -a -- jjl 'jj l'
#abbr -a -- fsrc 'cd (fd -td -H \'\.git$\' ~/ghq --prune -0 | xargs -0 dirname | fzf)'
abbr --a humio-infr open https://humio.prod.bloomberg.com/infr/search
abbr -a gmt go mod tidy
abbr -a gb go build
