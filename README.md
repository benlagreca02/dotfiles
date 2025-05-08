# Dotfiles 
These are my typical configs for various programs. I usually daily
drive Kubuntu (KDE on Ubuntu) and I haven't committed those configurations and
settings yet purely because I haven't gotten around to hunting down the files I
need to commit, although I know this would probably solved by googling around.

I've also been working on a Arch linux based, Hyprland setup. This has mostly
just been for fun in my freetime. 

## Pulling in the dotfiles.
If *you* want to use my dotffiles (yes you!) this is the subsection for you.

I did this according to [this
guide](https://www.atlassian.com/git/tutorials/dotfiles), and it's worked pretty
well for me so far.  Doing this will pull down the README.md file to your home
directory, I just delete it, and don't commit the fact that I deleted it.  To
install these dotfiles on a new machine, do the folowing

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

One day I'll script this somehow...

# ARCH

This includes my Arch linux, hyprland rice, and it is still in development, and I
don't consider it complete. I just work on this when I have time.

As of 5/4/25, it is pretty robust. Most key, critical things are there, with the
biggest missing link being some kind of program launcher (so I don't have to
open terminals and fork constantly)

For waybar's icons you need to install font awesome
```
pacman -S otf-font-awesome
```

## Colors
Right now, I assume a single wallpaper, and only have one "colorscheme" for
hyprland and waybar configured in their respective config files. I used pywal to
get a rough sense of the colors, but thats not really my focus right now, I'm
more focused on getting everything "functional", then I'll go and get colors
working much fancier later. I might do alternate "palletes" somehow, but thats
for later. Function > fashion.

## TODO
This is a list of things I'd like to do/update to the config/rice. This is
mostly specific to the Arch Hyprland setup.

### Functional 

These are the ones that will acutally impact the performance, and
quality of life of the system. I still need to do some of these before I declare
this system 100% "useable", thought it is getting pretty close.  I have thought
about switching my DE to be hyprland, but Ubuntu doesn't support it officially.
(Well, ubuntu 22 that is, which I needed for ROS2 Humble for school, but thats
not an issue any more!) I don't have plans to full-time switch to Arch (yet) but
I have considered it. 

- [ ] Figure out how to *really* use Rofi
- [ ] Make rofi not blurry
- [ ] Make discord not blurry by default (weird aliases?)
- [ ] screen rotation in tablet mode potentially?
- [ ] Make waybar power button actually do something
- [ ] Add bluetooth button in waybar
- [ ] add gammastep button to waybar (manual toggle for night shift))
- [ ] Learn how to backup system (pacakges and system, not just dotfiles)
- [ ] document keybindings for everything better
- [ ] Make some kind of a "print current keybind options" keybind?
- [ ] Default package install script of some kind (gammastep, Hyprland, waybar etc, things my rice needs)
- [ ] Make a "go to hyprland config folder" alias of some kind?
- [x] Consider looking into Dmenu or simmilar for app launching (Using ROFI)
- [x] Get dunst or some other notificaiton daemon confirmed working (CRITICAL FOR DISCORD TO NOT CRASH)
- [x] Make hyprlock actually lock on close and time out of inactivity
- [x] red light at night (using [gammastep](https://man.archlinux.org/man/gammastep.1.en)
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

- [ ] Rice Dunst so it doesn't just have the default configuration
- [ ] Custom VIM colorscheme (?)
- [ ] rice vim airline bar to have more info I care about
- [x] Make some kind of readme for where to edit colors per wallpaper
- [x] Get hyprland config syntax hilighting in vim (Its already there silly!)
- [x] fine tune the css for waybar (mostly color)
- [x] change border colors in hyprland
- [x] Fix waybar calendar to highlight the current day
- [x] Look into [pywal](https://github.com/dylanaraps/pywal) for auto color theming based on wallpaper (I don't like it)
- [x] See if waybar's colors can be influenced by pywal (I don't care that much)
