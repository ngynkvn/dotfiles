#!/usr/bin/fish

type fisher &>/dev/null || curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install jorgebucaran/nvm.fish
fisher install IlanCosman/tide@v6
fisher install kidonng/zoxide.fish

tide configure --auto --style=Lean --prompt_colors='True color' \
  --show_time='24-hour format' --lean_prompt_height='Two lines' \
  --prompt_connection=Solid --prompt_connection_andor_frame_color=Darkest \
  --prompt_spacing=Sparse --icons='Few icons' --transient=No

set -U zoxide_cmd cd

NODE_VERSION=v20.16.0
nvm install $NODE_VERSION
set -U nvm_default_version $NODE_VERSION
