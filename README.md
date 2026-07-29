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
This system is never truly complete, as it is always changing. I track
things I'd like to change some day here. I drive this system daily without much
issue, but whenever I get a minor annoyance, I track it here.

## Major (Functional)
- [ ] On boot, I get a 10th workspace (if multi-monitor, i get an 11th)
- [ ] Consider switching to use quickshell (instead of waybar)
- [ ] dunst notificaiton should focus program like discord when clicked (This may be impossible, switch to mako?)
- [ ] Learn how to backup system (pacakges and system, not just dotfiles)
- [ ] make hyprsunset nightlight intensity adjustable easily (redness) (might just wait until I switch to quickshell)
- [ ] Make hyprlock only show on one screen (prompt I mean, wallpaper should be on all)
- [ ] When docked and laptop closed, can't wake from suspend. Have to open laptop and hit power button (I think this is just how suspend works)

## Theming
Its pretty janky if you look under the hood, but I'm pretty proud of my themeing
engine I've thrown together with lots of scripts, and pywal16. I still need
to...
- [ ] Add more themes! (and tweak to confirm all are readable when developing (hard time currently with git status and git diff messages on space theme)
Make the following theme compliant:
- [ ] dunst
- [ ] vimairline (?)
- [ ] waybar calendar thingy highlight color

## Minor 
These are mostly astetic options, and some minorly functional things
- [ ] Make hyprland shadows less weird (I made them huge)
- [ ] Tooltips from hovering in firefox get corners cut off
- [ ] Some kind of a "now playing" on waybar? (might be easier in quickshell)
- [ ] hyprsunset based on timezone sunset, instead of fixed time
- [ ] Blueman theme should be dark mode (maybe find cool TUI alternative?)
- [ ] Tweak Rofi to look better
- [ ] Make dunst recognize spotify vs discord vs other notifs (not strictly necessary)
- [ ] essential package install script  (like LARBS)
- [ ] change around keybinds in newsboat some more

## Very Minor
These are mostly ideas, or things I might do
- [ ] Research power management stuff (save power when lid closed etc.)
- [ ] Add screen mirror button  (FN F7)
- [ ] make seprate "launch" scripts folder, and maybe add notify if not installed? (Potentially)
- [ ] waybar newsboat icon for "unread new feeds" maybe?
- [ ] screen rotation in tablet mode potentially?
- [ ] Play with the animations in Hyprland
- [ ] Rice Discord somehow
- [ ] Rice spotify somehow (spicefify)
- [ ] Rice newsboat looks

