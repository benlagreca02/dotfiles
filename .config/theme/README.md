# Theme

THIS ISN'T IMPLEMENTED THE WAY I WANT TO YET

One day, I want to write a script to change themes and go though wallpapers, but
thats in the distant future

This is all of the config files for editing the current "theme" These are just
the values that should be changed when theme is changed.  I want py-wal like
functionallity, but with way more control, and with added control, is added
PITA.

The idea is, that, when you want to change wallpapers/colorschemes, you only
need to edit things in this folder.

In a perfect world, Hyprland, Waybar, and any other program would all read from
one true file to rule them all, but thats not possible, since some use GTK/CSS,
and hyprland uses hyprlang.

## TODO 

I should really get rid of the weird constants I tried to do in here THIS FOLDER
SHOULD ONLY CONTAIN COLOR INFORMATION All other "tweaks" should be in their
respective configurations

Once I have the system fully "riced"  I'd like to make theme changing easy. This
is an extremely low priority, and will probably be more work than its worth.

- [ ] Make a custom file for "master colors" in a theme, in some unified way
  (RGBA ints for example)
- [ ] Write a script that reads from a "master color" file, and edits all
  necessary config files in this folder.

  Its only two "todo" items, but it won't be easy...

## Programs
hyprlandColors.conf 
    : The colors in hyprland

hyprlandThemeConstants.conf 
    : I should get rid of this one and move it back to hyprland the idea was
    that if I wanted to change corner rounding I could do it in one place, but
    its just too much

rofiColors.rasi
    : Application launcher
    
waybarColors.css
    : Colors across top bar

../dunst/dunstrc
    : Can't import config from other file, could do a symlink if I really wanted
    to, we'll see though
