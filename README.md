# dotfiles via chezmoi

My dotfiles!

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
