#!/opt/homebrew/bin/fish

# Check if fisher is installed, if not we `curl | source` it
type fisher &>/dev/null || \
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install jorgebucaran/nvm.fish \
  IlanCosman/tide@v6 \
  kidonng/zoxide.fish \
  PatrickF1/fzf.fish

tide configure --auto --style=Lean --prompt_colors='True color' \
  --show_time='24-hour format' --lean_prompt_height='Two lines' \
  --prompt_connection=Solid --prompt_connection_andor_frame_color=Darkest \
  --prompt_spacing=Sparse --icons='Few icons' --transient=No

set -U zoxide_cmd cd

set NODE_VERSION v20.17.0
nvm install $NODE_VERSION
set -U nvm_default_version $NODE_VERSION

fish_add_path ~/.local/bin/

