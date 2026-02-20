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
This system, in my opinion, is around 90% complete, and that last ten percent is
pretty minor, like notifications taking you to the respective program, tweaking
theme for blueman, and other "rices". Things I'd like to do at some point are in
the list below

## Major (Functional)
- [ ] Learn how to backup system (pacakges and system, not just dotfiles)
- [ ] make hyprsunset nightlight intensity adjustable easily
- [ ] Make script for color scheme changes (See note below)
- [ ] Make dunst notificaiton clickable (and bring back to program like discord)
- [ ] Dunst Can't close notifications sometimes (b.c. I can't focus them most likely, specifically bluetooth notifications)
- [ ] Add a brightness through hyprsunset gamma when connected to monitor that doesn't support it (desktop)
- [ ] When docked and laptop closed, can't wake from suspend. Have to open laptop and hit power button (maybe, have to verify)

## Minor 
These are mostly astetic options, and some minorly functional things
- [ ] hyprsunset based on timezone sunset, instead of fixed time
- [ ] Blueman theme should be dark mode (maybe find cool TUI alternative?)
- [ ] Tweak Rofi to look better
- [ ] Make dunst recognize spotify vs discord vs other notifs (not strictly necessary)
- [ ] Re-rice Dunst
- [ ] Custom VIM colorscheme maybe
- [ ] Custom Kitty colorscheme maybe
- [ ] essential package install script  (like LARBS)
- [ ] change around keybinds in newsboat some more

## Very Minor
These are mostly ideas, or things I might do
- [ ] Research power management stuff (save power when lid closed etc.)
- [ ] In kanshi, make docking/undocking generic, for not just my system
- [ ] Add screen mirror button  (FN F7)
- [ ] fix can't open newsboat from rofi (filepath issue I believe)
- [ ] make seprate "launch" scripts folder, and maybe add notify if not installed? (Potentially)
- [ ] waybar newsboat icon for "unread new feeds" maybe?
- [ ] screen rotation in tablet mode potentially?
- [ ] Play with the animations in Hyprland
- [ ] Rice Discord somehow
- [ ] Rice spotify somehow (spicefify)
- [ ] Rice newsboat looks

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

I'm thinking some kind of rofi/dmenu selection, which then goes and changes
colors in the respective programs, most notably:
- hyprland borders
- waybar CSS
- rofi

