function lldiff
    argparse 'g/grammar=?' 'm/model_name=?' 'd/model_dir=?' 'l/n_gpu_layers=?' 't/n_tokens=?' s/select -- $argv; or return
    type -q llama-cli; or begin
        echo "Missing llama-cli in path. Exiting"
        return 1
    end
    set -q _flag_g; and set GRAMMAR $_flag_g; or set GRAMMAR "$HOME/.local/llama.cpp/grammars/conventional-commit.gbnf"
    set -q _flag_m; and set MODEL_NAME $_flag_m; or set MODEL_NAME 'llama-3.2-3b-instruct-q8_0.gguf'
    set -q _flag_d; and set MODEL_DIR $_flag_d; or set MODEL_DIR "$HOME/.local/llama.cpp/models/"
    set -q _flag_l; and set NGPU_LAYERS $_flag_ng; or set NGPU_LAYERS 80
    set -q _flag_t; and set NTOKENS $_flag_nt; or set NTOKENS 512

    set -q _flag_s
    and set MODEL_PATH (find gguf $MODEL_DIR | fzf )
    or set MODEL_PATH "$MODEL_DIR$MODEL_NAME"

    set -l ignored
    /bin/cat .gitattributes | grep 'binary$' | cut -f1 -d' ' | while read line
        set -a ignored ":/!$line"
    end
    echo "ignoring: $ignored"

    set system_prompt "\
You are a commit message generator. 
Write short commit messages and include details based on the
diff file that follows. 
Think carefully before you write your commit message.
The message should not be any longer than 240 characters.
What you write will be given to `git commit -m [message]`.
Examples:
    - feat: implement JWT-based authentication system for secure user sessions
    - feat: add command line parsing and subcommands
    - fix: correct user session timeout issue by adjusting token expiration handling
    - chore: upgrade to latest version of Node.js and update dependency lockfile"
    set user_prompt "\
<diff>
$(git diff HEAD -- $ignored | /bin/cat)
</diff>"
    set promptfile (mktemp)
    _mk_prompt $MODEL_NAME $system_prompt $user_prompt >$promptfile
    and begin
        set_color 5261a9
        llama-cli -m $MODEL_PATH \
            -f $promptfile \
            -fa -ngl $NGPU_LAYERS -n $NTOKENS \
            --no-display-prompt \
            #--log-disable \
            --grammar-file $GRAMMAR
        set_color normal
    end
end
