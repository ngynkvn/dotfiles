# Snippets

```bash
rg '^background = (#\w+)' -r '$1' | while read theme
    set brightness (echo $theme | cut -d':' -f2 | pastel format brightness)
    echo $brightness:$theme
end > brightnesses.txt
```

```bash
brew info --json --installed | jq '.[] | "- [\(.full_name)](\(.homepage)): \(.desc)"' -cr > ~/.local/brew-installed.md
```
