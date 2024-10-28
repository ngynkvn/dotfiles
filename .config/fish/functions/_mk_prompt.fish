function _mk_prompt --argument model_name system_prompt user_prompt
    if string match -i '*dolphin*' $model_name
        echo "\
<|im_start|>system
$system_prompt<|im_end|>
<|im_start|>user
$user_prompt<|im_end|>
<|im_start|>assistant
"
    else if string match -i '*llama-3*' $model_name
        echo "\
<|begin_of_text|>\
<|start_header_id|>system<|end_header_id|>
$system_prompt<|eot_id|>\
<|start_header_id|>user<|end_header_id|>
$user_prompt<|eot_id|>\
<|start_header_id|>assistant<|end_header_id|>
"
    else if string match -i '*Qwen2*' $model_name
        echo "\
<|im_start|>system
$system_prompt<|im_end|>
<|im_start|>user
$user_prompt<|im_end|>
<|im_start|>assistant
"
    else
        echo "$(set_color red)ERROR: unknown model prompt format for $(set_color normal)$model_name"
        return 1
    end

end
