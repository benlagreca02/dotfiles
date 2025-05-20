# Dotfiles 
These are my typical configs for various programs. I usually daily
drive Kubuntu (KDE on Ubuntu) and I haven't committed those configurations and
settings yet purely because I haven't gotten around to hunting down the files I
need to commit, although I know this would probably solved by googling around.

I've also been working on a Arch linux based, Hyprland setup. This has mostly
just been for fun in my freetime, but I'm *really* considering switching to
usign arch full time.

## Pulling in the dotfiles.  
If *you* want to use my dotffiles and scripts (yes you!) this is the subsection
for you.

For dotfile management, I followed [this
guide](https://www.atlassian.com/git/tutorials/dotfiles), and it's worked great
for me so far. Doing this will pull down the README.md file to your home
directory, I just delete it, and don't commit the fact that I deleted it. 

To install these dotfiles on a new machine, do the folowing:

Make a folder called .cfg, this is where the headless git repo will store its files
```bash
mkdir ~/.cfg
```
Alias "config", this makes a short hand for "git but from the .cfg folder we
just created, and the 'working tree' will be the home directory" This alias will
later be defined in the `.bashrc` once you pull down the files , so you only
have to do this once to pull down the files initially.
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
The tutorial I'm stealing from says to do this command to prevent recursion
problems, but you may be able to skip it? I don't think I've ever done it
```bash
echo ".cfg" >> .gitignore
```
Clone the repo, just pulls down info about files, not the actual files
```bash
git clone --bare https://github.com/benlagreca02/dotfiles.git $HOME/.cfg
```

Next, pull down the actual dotfiles.  There's a good chance this line will yell
at you warning that you will overwrite some files (usually `.bashrc`), so delete
the files so you can pull down mine.
```bash
config checkout
```

Hide files in your home directory that _aren't_ a part of the repo. You totally
want this, otherwise everything will be shown as "untracked file".
```bash
config config --local status.showUntrackedFiles no 
```


TL;DR
For all of it in one clean copypaste, do this!
```bash
mkdir ~/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/benlagreca02/dotfiles.git $HOME/.cfg
config checkout
```
It will most likely yell at your for existing configs, delete them and then...
```bash
config checkout
config config --local status.showUntrackedFiles no
```

One day I'll script this somehow...

## Future scripting

- [ ] Arch may need a `systemctl start example.service` (5/17/25) for bluetooth
  and a few other things
- [ ] Could make a "download and install" script at some point. Arch could
  install things like hyprland, font-awesome, rofi, etc.

# ARCH

This includes my Arch linux, hyprland rice, and it is still in development, and I
don't consider it complete. I just work on this when I have time.

As of 5/20/25, it is really getting there. Its so close to being something I
call "done enough" to make a "release" but its really getting somewhere.

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

The "dream" is to have a set of wallpapers, and on changing them, all colors get
updated to match: BUT I have those colors custom defined. I don't like that
pywall changes the colors of terminal and vim stuff by default. Errors should
_always_ be red, and successes should _always_ be green, I don't want PyWal to
make them blue, and darker blue. 

This goal would take a lot of scripting, but I need to learn anyways, so I'll
do it one day hopefully.

## TODO
This is a list of things I'd like to do/update to the config/rice. This is
almost entirely for the Arch-linux Hyprland "rice".

### Functional 

These are things that will acutally impact the quality of life of using the
system. I still need to do some of these before I declare this system 100%
"useable", thought it is getting pretty close.  I have thought about switching
my DE to be hyprland, but Ubuntu doesn't support it officially.  (Well, ubuntu
22 that is, which I needed for ROS2 Humble for school, but thats not an issue
any more!) I don't have plans to full-time switch to Arch (yet) but I have
considered it. 

- [ ] Configure Bluetooth button in waybar
- [ ] Learn how to backup system (pacakges and system, not just dotfiles)
- [ ] Look into power management stuff (better performance vs battery modes)

#### Lower Priority
- [ ] Clean out home dir, (Move configs to XDG\_CONFIG)
- [ ] Fix Rofi SSHing (idk if I care that much atm) (may just do a dmenu selector script)
- [ ] Rofi website bookmark loading (type github and it opens firefox to GH)
- [ ] screen rotation in tablet mode potentially?
- [ ] document keybindings for everything better
- [ ] rice vim airline bar to have more info I care about
- [ ] Make some kind of a "print current keybind options" keybind?
- [ ] "edit configs" script with dmenu/rofi of some kind (can type "rofi" and rofi config will open in vim)
- [ ] essential package install script of some kind (gammastep, Hyprland, waybar etc, things my rice needs)
- [ ] add gammastep button to waybar (manual toggle for night shift))
- [ ] Make gammastep button icon change with time, and on manual change

### Aesthetics
These are the unimportant for functionallity, pretty, and overall not-needed
things. They make it look really cool, but you don't need them.

- [ ] Rice Dunst so it doesn't just have the default configuration
- [ ] Rice Discord somehow
- [ ] Rice spotify somehow (spicefify)
- [ ] Custom VIM colorscheme (?)
- [ ] Make scripts for color scheme changes (?) (HARD)

### Done 
- [x] Get bluetooth working for real
- [x] Add bluetooth button in waybar (and get bluetooth working)
- [x] Make waybar power button actually do something
- [x] Make rofi not blurry
- [x] Make discord not blurry (xwayland setting in main hyprland config)
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
- [x] Rice ROFI (Its good enough as is right now
- [x] Make some kind of readme for where to edit colors per wallpaper
- [x] Get hyprland config syntax hilighting in vim (Its already there silly!)
- [x] fine tune the css for waybar (mostly color)
- [x] change border colors in hyprland
- [x] Fix waybar calendar to highlight the current day
- [x] Look into [pywal](https://github.com/dylanaraps/pywal) for auto color theming based on wallpaper (I don't like it)
- [x] See if waybar's colors can be influenced by pywal (I don't care that much)
