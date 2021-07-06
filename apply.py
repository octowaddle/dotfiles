#!/usr/bin/env python

from pathlib import Path
import os
import sys

link = False
delete_existing = False

# List files
files = [".vim/vimrc", ".bashrc", ".config/nvim/init.vim",
         ".config/alacritty/alacritty.yml", ".config/bspwm/bspwmrc",
         ".config/bspwm/scripts/resize.sh", ".config/sxhkd/sxhkdrc",
         ".config/picom/picom.conf", ".config/polybar/config",
         ".config/dunst/dunstrc", ".config/fish/config.fish",
         ".config/nvim/after/ftplugin/c.vim", ".config/nvim/coc-settings.json",
         ".config/alacritty/colorschemes/bogster.yml", ".wallpapers/1.jpg"]

very_personal_files = [".gitconfig"]

# Arguments
if "--link" in sys.argv:
    link = True
if "--delete-existing" in sys.argv:
    delete_existing = True

# Set working directory to file directory
os.chdir(os.path.dirname(os.path.realpath(__file__)))

def process(files):
    for file in files:
        absolute = (os.path.abspath(file))
        home = str(Path.home())

        # Check if the file exists in the dotfiles directory
        if not os.path.isfile(absolute):
            print(f"File does not exist: {absolute}")
            continue

        # Check if the file exists in the user directory
        if os.path.isfile(f"{home}/{file}"):
            if delete_existing:
                if os.path.islink(f"{home}/{file}"):
                    os.system(f"unlink {home}/{file}")
                    print(f"Unlinked existing file {home}/{file}.")
                else:
                    os.system(f"rm {home}/{file}")
                    print(f"Deleted existing file {home}/{file}.")
            else:
                print(f"File {home}/{file} already exists. Skipping.")
                continue

        # Create the parent directories if necessary.
        if os.path.dirname(file):
            os.system(f"mkdir -p {home}/{os.path.dirname(file)}")

        # Create a symbolic link
        if link:
            os.system(f"ln -s {absolute} {home}/{file}")
            print(f"Created symbolic link from {absolute} to {home}/{file}")
        else:
            os.system(f"cp {absolute} {home}/{file}")
            print(f"Copied file from {absolute} to {home}/{file}")

process(files)

if "--very-personal" in sys.argv:
    process(very_personal_files)

