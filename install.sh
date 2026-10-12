dir=~/dotfiles

link() {
    echo "Creating symlink to $1 in home directory."
    ln -sf "$dir/$1" ~/"${2:-$1}"
}

for file in .aliases .bash_prompt .exports .gitconfig .vimrc .inputrc .editorconfig; do
    link $file
done

if [[ "$OSTYPE" == msys* ]]; then
    # Git Bash on Windows
    for file in .bash_profile .bashrc .minttyrc .wslconfig .eslintrc.js package.json package-lock.json; do
        link $file
    done
    link .gitconfig.windows .gitconfig.local

    # Windows Terminal settings
    terminalDir=~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe

    if [ -d "$terminalDir" ]; then
        cp ./windows-terminal-settings.json "$terminalDir/LocalState/settings.json"
        cp -r ./icons/. "$terminalDir/RoamingState"
    fi

    echo "Installing npm dependencies..."
    cd ~/ && npm i
else
    # Linux / WSL: keep the distro's .bashrc and load the dotfiles from it
    line='[ -r ~/dotfiles/.bash_profile ] && source ~/dotfiles/.bash_profile'
    grep -qxF "$line" ~/.bashrc || printf '\n# Dotfiles\n%s\n' "$line" >> ~/.bashrc
fi
