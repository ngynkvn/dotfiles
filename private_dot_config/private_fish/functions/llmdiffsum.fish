function llmdiffsum
    set -l ignored
    /bin/cat .gitattributes | grep 'binary$' | cut -f1 -d' ' | while read line
        set -a ignored ":/!$line"
    end
    echo "ignoring: $ignored"
    set prompt "
Summarize my diff in a commit message for me:
<diff>
$(git diff HEAD -- $ignored | /bin/cat)
</diff>
"; and aiprompt $prompt
end
