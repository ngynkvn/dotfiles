function jp --wraps='vim $(zoxide query -sl | fzf)' --wraps='zoxide query -sl | fzf' --wraps='zoxide query -sl | fzf --nth=2..' --wraps='zoxide query -sl | fzf --nth=2' --wraps='zoxide query -sl | fzf --nth=3' --wraps=zoxide\ query\ -sl\ \|\ fzf\ --bind\ \'enter:become\(vim\ \{2\}\)\' --description alias\ jp=zoxide\ query\ -sl\ \|\ fzf\ --bind\ \'enter:become\(vim\ \{2\}\)\'
  zoxide query -sl | fzf --bind 'enter:become(vim {2})' $argv
        
end
