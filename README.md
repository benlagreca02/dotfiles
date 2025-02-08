# Dotfiles 
These are my typical configs for various programs. I usually daily
drive Kubuntu (KDE on Ubuntu) and I haven't committed those configurations and
settings yet purely because I haven't gotten around to hunting down the files I
need to commit, although I know this would probably solved by googling around.

I've also been working on a Arch linux based, Hyprland setup, and have
considered switching my ubuntu setup to be 

## Pulling in the dotfiles.
I did this according to [this guide](https://www.atlassian.com/git/tutorials/dotfiles), and it's worked pretty well for me so far.

Doing this will pull down the README.md file to your home directory, I just delete it, and don't commit the fact that I deleted it.

To install these dotfiles on a new machine, do the folowing

Make a folder called .cfg, this is where the headless git repo will store its files
```bash
mkdir ~/.cfg
```
Alias "config", this makes a short hand for "git but from the .cfg folder we
just created, and the 'working tree' will be the home directory"
This alias will later be defined in the `.bashrc`, so you only have to do this
once to pull down the files initially
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
The tutorial I'm stealing from says to do this command to prevent recursion
problems, but you may be able to skip it?
```bash
echo ".cfg" >> .gitignore
```
Clone the repo, just pulls down info about files, not the actual files
```bash
git clone --bare https://github.com/benlagreca02/dotfiles.git $HOME/.cfg
```
Pull down the actual dotfiles
```bash
config checkout
```
There's a good chance this line will yell at you warning that you're gonna
overwrite some files (usually `.bashrc`), so delete the files so you can pull
down mine.

Don't show files that aren't a part of the repo, you'll want this unless you
want to see _every_ file in your home directory as "untracked file" 
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

This includes my Arch linux, hyprland rice, and it is still in development, and I
don't consider it complete. I just work on this when I have time.

As of 1/9/25, it is pretty robust, and I can get a good chunk of things done,
but I really need to add a program launcher, and some other pretty important
things, but its coming along quite well. The hardest part is figuring out what
programs I actually need, but I can usually figure it out by googling what
functionallity I want, then figuring out the program after. (I googled "locking
in hyprland", and discovered hyprlock)

For waybar's icons you need to install font awesome
```
pacman -S otf-font-awesome
```

## Colors
Right now, I assume a single wallpaper, and only have one "colorscheme" for
hyprland and waybar configured in their respective config files. I used pywal to
get a rough sense of the colors, but thats not really my focus right now, I'm
more focused on getting everything "functional", then I'll go and get colors
working much fancier.

## TODO
This is a list of things I'd like to do/update to the config/rice. This is
mostly specific to the Arch Hyprland setup.

### Functional
These are the ones that will acutally impact the performance of the system. I
still need to do some of these before I declare this system "useable". I have
thought about switching my normal DE to be hyprland, but I use ubuntu for
stabliity most often (and ROS support). I don't have plans to full-time switch
to Arch (yet) but I have considered it.

- [ ] Make waybar power button actually do something
- [ ] "Night light" for red light at night (red shift or whatever you wanna call it)
- [ ] Hyprland add keybind to move a window up/down the stack
- [ ] Manage packages and see how to get dependencies for scripts (?), also
  install dependencies on pull-down of config repo possibly
- [ ] Backup system (pacakges and system, not just dotfiles)
- [ ] rice vim airline bar to have more info I care about
- [ ] Get dunst or some other notificaiton daemon confirmed working
- [ ] document keybindings for everything
- [ ] Consider looking into Dmenu or simmilar for app launching
- [ ] Make a "go to hyprland config folder" alias of some kind?
- [ ] Make hyprlock actually lock on close and time out of inactivity
- [x] Set up a "locking" or idle manager (hyprlock)
- [x] In waybar, highlight active window number
- [x] Add screen brightness info to waybar
- [x] Add network info to waybar
- [x] screen brightness keys
- [x] auto-reload for waybar
- [x] Add battery state to waybar
- [x] Volume Control keys
- [x] Add battery "charging" indication somehow
- [x] break hyprland config into folder and smaller files


### Aesthetics
These are the unimportant for functionallity, pretty, and overall not-needed
things. They make it look really cool, but you don't need them.

- [ ] Custom VIM colorscheme (?)
- [x] Make some kind of readme for where to edit colors per wallpaper
- [x] Get hyprland config syntax hilighting in vim (Its already there silly!)
- [x] fine tune the css for waybar (mostly color)
- [x] change border colors in hyprland
- [x] Fix waybar calendar to highlight the current day
- [x] Look into [pywal](https://github.com/dylanaraps/pywal) for auto color
  theming based on wallpaper (I don't like it)
- [x] See if waybar's colors can be influenced by pywal (I don't care that much)
