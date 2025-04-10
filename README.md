# dotfiles via chezmoi

My dotfiles!

## Important commands

[navi](https://github.com/denisidoro/navi)
[jj](https://github.com/jj-vcs/jj)
[ripgrep](https://github.com/BurntSushi/ripgrep)
[fd](https://github.com/sharkdp/fd)
[zig](https://ziglang.org/)
[pastel](https://github.com/sharkdp/pastel)
[uv](https://docs.astral.sh/uv/)
[git-extras](https://github.com/tj/git-extras)
[fish](https://fishshell.com)
[dust](https://github.com/bootandy/dust)
[tldr](https://tldr.sh/)
[just](https://github.com/casey/just)
[bat](https://github.com/sharkdp/bat)
[chezmoi](https://chezmoi.io/)
[neovim](https://neovim.io/)

## Test

```bash
  docker build -t chez:latest --progress=plain --no-cache . && docker run --rm -it chez:latest bash

```

## Gotchas

```
set -Ux $_tide_left_prompt_items pwd jj git newline character

```

Don't be dumb again Kev and do the above again ... this is like the third time
now

<details>
    <summary></summary>

The `$` ya goof! It's gonna be evaluated 🤦‍♀️

</details>
