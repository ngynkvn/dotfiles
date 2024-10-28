function cat --wraps=bat --description 'alias cat=bat'
    set exe (basename (type -p batcat || type -p bat))
    $exe $argv
end
