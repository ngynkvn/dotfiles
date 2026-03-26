function cat --wraps=bat --description 'alias cat=bat'
    type -P batcat bat 2>/dev/null | read exe
    $exe $argv
end
