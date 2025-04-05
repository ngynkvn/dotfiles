function toggle-shader
    set ghostty_config "$HOME/.config/ghostty/config"
    grep -q '^#+custom-shader' $ghostty_config
    and sed -e '/custom-shader/s/^#*//' -i '' $ghostty_config && echo 'shaders on'
    or sed -e '/custom-shader/s/^#*/#/' -i '' $ghostty_config && echo 'shaders off'
end
