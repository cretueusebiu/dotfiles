# Load dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,extra,minttyrc,inputrc,vimrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
