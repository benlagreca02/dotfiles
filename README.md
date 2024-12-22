# Dotfiles
These are my typical configs for various programs. I usually daily drive Kubuntu (KDE on Ubuntu) and 
I haven't committed those configurations and settings yet purely because I haven't gotten around to 
hunting down the files I need to commit, although I know this would probably solved by googling around.

I do plan on starting to develop a wayland based hyprland arch config, and have
started doing a bit of it. See the "Arch" section below

## Pulling in the dotfiles.
I did this according to [this guide](https://www.atlassian.com/git/tutorials/dotfiles), and it's worked pretty well for me so far.

Doing this will pull down the README.md file to your home directory, I just delete it, and don't commit the fact that I deleted it.

To install these dotfiles on a new machine, do the folowing

Make a folder called .cfg, this is where the headless git repo will store its files
```bash
mkdir ~/.cfg
```
Alias "config", this makes a short hand for "git but from the .cfg folder we just created, and the 'working tree' will be the home directory"
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
The tutorial says to do this command to prevent recursion problems, but you may be able to skip it?
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

For all of it in one clean copypaste, do this!
```bash
mkdir ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/benlagreca02/dotfiles.git $HOME/.cfg
config checkout
```
At this point you'll probably need to delete existing configs, then...
```bash
config checkout
config config --local status.showUntrackedFiles no
```

# ARCH

This is my Arch linux, hyprland rice, and it is still HEAVILY in development. I
just work on this when I have time.

As of 12/21/24, it is extremely minimal, and really only has volume control, and
some very simple keybinds I'm too lazy to document right now.

For waybar's icons you need to install font awesome
```
pacman -S otf-font-awesome
```

## TODO
-[ ] Backup system (figure it out)
-[ ] Manage packages and see how to get dependencies for scripts (?)
-[ ] screen brightness keys
-[ ] break hyprland config into folder and smaller files
-[ ] Look into [pywal](https://github.com/dylanaraps/pywal)
-[x] Fix waybar calendar to highlight the current day
-[x] auto-reload for waybar
-[x] Volume Control keys
