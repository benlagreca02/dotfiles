# Dotfiles 
Configuration files for my Hyprland based, Arch linux setup. 

# Installing  

TL;DR Pull down the headless repo and checkout all the files
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
You will most likely want to delete the `README.md` file. I'm sure there's a way
to have the home folder somewhere else, but whatever.


[This is the original guide I followed](https://www.atlassian.com/git/tutorials/dotfiles)


# TODO
At this point, I've been daily driving the system for months with very few
issues. Whenver I have an issue, I immediatly address it (if its bad enough) or
I simply add it to this giant list. 

## Major
- [ ] essential package install script of some kind (gammastep, Hyprland, waybar etc, things my rice needs, like LARBS)
- [ ] systemctl setup for arch if needed
- [ ] Learn how to backup system (pacakges and system, not just dotfiles)
## Minor
- [ ] Distch gammastep switch to wlsunset (allows easier scripting for waybar)
- [ ] When docked and laptop closed, can't wake from suspend
- [ ] Fix everything to use _just_ the nerdfont version of iosevka, instead of the standalone package
- [ ] Dunst could use more configuring (Maybe? Can't close notifications sometimes, I think b.c. I can't focus them)
- [ ] make seprate "launch" scripts folder, and maybe add notify if not installed? (Potentially)
- [ ] fix can't open newsboat from rofi (filepath issue I believe)
- [ ] change around keybinds in newsboat some more
- [ ] Bookmarking in newsboat (? what did I mean by this)
- [ ] waybar newsboat icon for "unread new feeds" maybe?
- [ ] Look into power management stuff (better performance vs battery modes)
- [ ] Rofi/Dmenu script for selecting common SSH clients somehow (simmilar to web bookmarks potentially)
- [ ] "edit configs" script with dmenu/rofi of some kind (can type "rofi" and rofi config will open in vim, distrotube has one)
- [ ] screen rotation in tablet mode potentially? (I hardly use it, so ROI is low)
- [ ] document keybindings for everything better 
- [ ] Make some kind of a "print current keybind options" keybind? 
- [ ] Play with the animations in Hyprland
- [ ] Rice newsboat some more
- [ ] rice vim airline bar to have more info I care about
- [ ] Make dunst recognize spotify vs discord vs other notifs (not strictly necessary)
- [ ] Custom VIM colorscheme maybe
- [ ] Make scripts for color scheme changes (?) (HARD)
- [ ] Rice Discord somehow
- [ ] Rice spotify somehow (spicefify)

## Colors 
PyWal is cool, but I don't like that it overrides your colors.  Errors
should _always_ be red, and successes should _always_ be green, regardless of
your cool color profiles. I don't want PyWal to make them blue, and darker blue. 

Right now, I assume a single wallpaper, and only have one "colorscheme" for
hyprland and waybar configured in their respective config files. I used pywal to
get a rough sense of the colors, but thats not really my focus right now, I'm
more focused on getting everything "functional", then I'll go and get colors
working much fancier later. I might do alternate "palletes" somehow, but thats
for later. Function > fashion.

The "dream" is to have a set of wallpapers, and on changing them, all colors get
updated to match: BUT I have those colors custom defined. I don't like that
pywall changes the colors of terminal and vim stuff by default.

This goal would take a lot of scripting, but I need to learn anyways, so I'll
do it one day hopefully.
