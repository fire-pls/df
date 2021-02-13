# Set the color scheme
# colorscheme kaleidoscope-dark

# Indent with 2 spaces
set-option global indentwidth 2

# Always keep one line and three columns displayed around the cursor
set-option global scrolloff 1,3

# Display the status bar on top
 set-option global ui_options ncurses_status_on_top=true

# Display line numbers
add-highlighter global/ number-lines -hlcursor

# Highlight trailing whitespace
add-highlighter global/ regex \h+$ 0:Error

# Softwrap long lines
add-highlighter global/ wrap -word -indent

# Clipboard management mappings
map -docstring "yank selection into OS clipboard" global user y "<a-|> pbcopy<ret>"
map -docstring "paste from OS clipboard" global user p "<a-!> pbpaste<ret>"

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

# Init plugins
#
