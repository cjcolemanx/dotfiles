# What this is

`make-rc.sh` compiles user-selected `sxhkdrc.*` files into a single `sxhkdrc`.

Keymaps are gotten with this script as well, and appended to `keymap.txt`.

Backups of `sxhkdrc` and `keymaps.txt` are automatically backed up.

# Writing a new config

1. Create a new file named `sxhkdrc.<your_chosen_config_name>`.
2. Add a header:

```
#######################
### ~| <header_name> |~
#######################
```

    a. The line between the long lines of `#` is what is used to create the
    keymap.txt file.
    b. For consistency, title the section the same as the config name you chose
    for the file itself.
    c. Add any notes that aren't a description of a binding underneath the
    `<header_name>`.

3. Bind keys underneath the header. Include a single-line description of the
   keybind. Use this format:

```
# <Description>
<Bind>
    <Command>
```

Example:

```
# Open Terminal
super + return
   kitty
```

# Writing your bindings

Due to my iconoclastic scripting skills, there are some stipulations to how the
configs must be written.

Things will break if you:

1. add inline comments to the bindings (instead prefix extra informatino with a `# NOTE:`, `# WARN:`,
   or `# FIXME:` - these are ignored in the `awk`)
2. split binds onto multiple lines (instead use single lines)
3. add multi-line comments (see #1)
4. coment out keybinds with a single '#' and no space in between the
   binds/commands (instead use 2 '#' or remove any space between the excluded
   binds)

Things you should do:

1. document important things in the header:

```
### Dependencies:
###     - mpd
###     - ncmpcpp
```

2. give short descriptions - I did not add logic to the script to handle
   breaking lines into readable lengths in `keymap.txt`

# Running the script

You can specify which configs to include in the **INCLUDED_MAPPINGS** array in
`make-rc.sh`.

After defining your mappings and adding them to the array, simply execute the
script and the `sxhkdrc` config will be generated : ).

# Todo

- [ ] TODO: add line breaks to `keymap.txt` generation
- [ ] TODO: allow multiple backups
- [ ] TODO: add checks for array lengths in `add_mapfile_to_keymaps`
