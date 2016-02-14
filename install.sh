dir=~/dotfiles
files="aliases bash_profile bashrc bash_prompt exports gitconfig minttyrc vimrc inputrc"

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf "$dir/.$file" ~/.$file
done
