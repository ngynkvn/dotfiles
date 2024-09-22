function llmdiffsum
    set -l ignored
    cat .gitattributes | grep 'binary$' | cut -f1 -d' ' | while read line
        set -a ignored ":/!$line"
    end
    echo "ignoring: $ignored"
    begin
        echo 'Summarize my diff in a commit message for me:'
        echo '<diff>'
        git diff HEAD -- $ignored | /bin/cat
        echo '</diff>'
    end | ollama run llama3.1
end
