# This first creates a function last_history_item which outputs the last entered command. It then
# adds an abbreviation which replaces !! with the result of calling this function. Taken together,
# this is similar to the !! history expansion feature of bash.
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
