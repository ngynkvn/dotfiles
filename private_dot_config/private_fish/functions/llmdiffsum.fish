function llmdiffsum
    type -q llama-cli; or begin
        echo "Missing llama-cli in path. Exiting"
        return 1
    end
    set -q GRAMMAR; or set GRAMMAR "$HOME/.local/llama.cpp/grammars/conventional-commit.gbnf"
    # TODO: configuration
    set -q MODEL_NAME; or set MODEL_NAME 'meta-llama-3.1-8b-instruct.Q4_K_M.gguf'
    set -q MODEL_DIR; or set MODEL_DIR "$HOME/.local/llama.cpp/models/"
    set -q MODEL_PATH; or set MODEL_PATH "$MODEL_DIR$MODEL_NAME"

    set -l ignored
    /bin/cat .gitattributes | grep 'binary$' | cut -f1 -d' ' | while read line
        set -a ignored ":/!$line"
    end
    echo "ignoring: $ignored"

    set promptfile (mktemp)
    echo >$promptfile "\
<|begin_of_text|><|start_header_id|>system<|end_header_id|>
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
    - chore: upgrade to latest version of Node.js and update dependency lockfile <|eot_id|>\ <|start_header_id|>user<|end_header_id|>
<diff>
$(git diff HEAD -- $ignored | /bin/cat)
</diff><|eot_id|><|start_header_id|>assistant<|end_header_id|>"
    and llama-cli -m $MODEL_PATH \
        -f $promptfile \
        --grammar-file $GRAMMAR
end


# <|begin_of_text|><|start_header_id|>system<|end_header_id|>
# Write short commit messages:
# - The first line should be a short summary of the changes
# - Remember to mention the files that were changed, and what was changed
# - Explain the 'why' behind changes
# - Use bullet points for multiple changes
# - If there are no changes, or the input is blank - then return a blank string
#
# Think carefully before you write your commit message.
#
# The output format should be:
#
# <format>
# (type): description
#
# [optional body]
# <end_format>
#
# What you write will be passed directly to git commit -m \"[message]\"<|eot_id|>
# <|start_header_id|>user<|end_header_id|>
# $prompt<|eot_id|>
# <|start_header_id|>assistant<|end_header_id|>
#
