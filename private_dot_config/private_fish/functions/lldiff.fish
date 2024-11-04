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

    set system_prompt '\
You are a commit message generator that follows the Conventional Commits specification.

Input: Git diff output
Output: A single-line commit message following this format:
<type>[(scope)]: <description>

Rules:
- Types must be one of: feat, fix, chore, docs, style, refactor, perf, test
- Include scope in parentheses when changes affect a specific component/module
- Description should be present tense, imperative mood (e.g., "add" not "adds" or "added")
- Mention specific technical details when significant (function names, key variables, etc.)
- Keep total message length under 72 characters when possible
- Don\'t mention obvious details like "update file" or "modify code"

Examples:
feat(auth): implement JWT-based session management
fix(api): handle null response in user validation
refactor(db): optimize query performance with indexes
docs(readme): add API authentication instructions
perf(search): reduce memory usage in indexing logic\
'
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
