# Dotfiles
These are my typical configs for various programs. I usually daily drive Kubuntu (KDE on Ubuntu) and I haven't committed those configurations and settings yet purely because I haven't gotten around to hunting down the files I need to commit, although I know this would probably solved by googling around.

## Pulling in the dotfiles.
I did this according to [this guide](https://www.atlassian.com/git/tutorials/dotfiles), and it's worked pretty well for me so far. In short to install these dotfiles on a new machine, do the folowing

Make a folder called .cfg, this is where the headless git repo will store its files
```bash
mkdir ~/.cfg
```
Alias "config", this makes a short hand for "git but from the .cfg folder we just created, and the 'working tree' will be the home directory"
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
The tutorial says to do this command to prevent recursion problems, but you may be able to skip it? I
```bash
echo ".cfg" >> .gitignore
```
Clone the repo, just pulls down the details, not the actual files
```bash
git clone --bare https://github.com/benlagreca02/dotfiles.git $HOME/.cfg
```

Pull down the actual dotfiles
```bash
config checkout
```

Don't show files that aren't a part of the repo, you'll want this unless you want to see _every_ file in your home directory as "untracked file"
```bash
config config --local status.showUntrackedFiles no
```
