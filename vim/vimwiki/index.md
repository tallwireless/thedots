# The TallWireless VIM Wiki

## Key Strokes
### Generic
Spelling: `\s`
Paste Mode: `<F2>`
Show White Space: `<F3>`
Show Tabs: `<F4>`
Launch Terminal: `<F12>`
Save & Make: `\m`

### ALE
ALEFix: `<F10>`

### QuickScope
Move forward to character: `f<highlighted char>`
Move backwards to character: `T<highlighted char>`

### vim-surround
Change Wrapping: `cs<old><new>`
Add Wrapping to word: `ysiw<new>`
Add Wrapping to line: `yss<new>`

### NERDTree
Launch NERDTree: `\n`
Open File in tab: highlight file, press `t`
Open File in split: highlight file, press `s`

## General Settings

### Title
The title of the application for the window is either `vim(<filename>)` or
`v(<filename>)` depending on whether you are in a TMUX session or not. Gotta
save those characters!

### Plugins
Plugins are managed with Vundle

### Terminal
* All mouse interactions are disabled
* Lines are truncated at 80 characters

### Searching
* Searching is case insensative
