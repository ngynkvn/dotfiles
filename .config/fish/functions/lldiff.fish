function lldiff
    argparse 'g/grammar=?' 'm/model_name=?' 'd/model_dir=?' 't/n_tokens=?' 'c/ctx_size=?' s/select -- $argv; or return
    type -q llama-cli; or begin
        echo "Missing llama-cli in path. Exiting"
        return 1
    end
    set -q _flag_g; and set GRAMMAR $_flag_g; or set GRAMMAR "$HOME/.local/llama.cpp/grammars/conventional-commit.gbnf"
    set -q _flag_m; and set MODEL_NAME $_flag_m; or set MODEL_NAME 'llama-3.2-3b-instruct-q8_0.gguf'
    set -q _flag_d; and set MODEL_DIR $_flag_d; or set MODEL_DIR "$HOME/.local/llama.cpp/models/"
    set -q _flag_c; and set CTXSIZE $_flag_c; or set CTXSIZE 8192
    set -q _flag_t; and set NTOKENS $_flag_t; or set NTOKENS 512

    set -q _flag_s
    and set MODEL_PATH (find gguf $MODEL_DIR | fzf )
    or set MODEL_PATH "$MODEL_DIR$MODEL_NAME"

    set -l ignored
    /bin/cat .gitattributes | grep 'binary$' | cut -f1 -d' ' | while read line
        set -a ignored ":/!$line"
    end
    echo "ignoring: $ignored"

    set system_prompt "\
You are a helpful assistant that generates commit messages. 
Write short commit messages that includes details based on the diff output that the user provides 
The message should only be one sentence that captures as much detail as possible.
Write ONLY the commit message, and nothing else.
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
    and _mk_prompt $MODEL_NAME $system_prompt $user_prompt >$promptfile
    and begin
        set_color 5261a9
        llama-cli \
            --no-display-prompt \
            --no-warmup --simple-io \
            -m $MODEL_PATH \
            -f $promptfile \
            -fa -n $NTOKENS -c $CTXSIZE \
            --grammar-file $GRAMMAR 2>/dev/null
        #--log-disable \
        set_color normal
        rm $promptfile
    end
end
