function aiprompt --description 'Prompt llama.cpp'
    type -q llama-cli; or begin
        echo "Missing llama-cli in path. Exiting"
        return 1
    end
    # TODO: configuration
    set -q MODEL_NAME; or set MODEL_NAME 'OLMoE-1B-7B-0924-Instruct-Q6_K_L.gguf'
    set -q MODEL_DIR; or set MODEL_DIR "$HOME/.local/llama.cpp/models/"
    set -q MODEL_PATH; or set MODEL_PATH "$MODEL_DIR$MODEL_NAME"
    # TODO: Don't know what a good number is.
    set -q LLAMA_ARG_N_GPU_LAYERS; or set LLAMA_ARG_N_GPU_LAYERS 8
    set -q LLAMA_ARG_FLASH_ATTN; or set LLAMA_ARG_FLASH_ATTN 1

    llama-cli -co -m $MODEL_PATH --prompt $argv 2>/dev/null
end
