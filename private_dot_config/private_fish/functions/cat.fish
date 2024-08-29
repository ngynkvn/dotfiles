set _EXE (basename (type -p batcat || type -p bat))
function cat --wraps=$E --description "alias cat=$_EXE"
    $_EXE $argv
end
