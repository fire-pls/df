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
map -docstring "leave buffer to navigate filetree" global user 0 ":filetree<ret>"
map -docstring "comment selected lines" global user / ":comment-line<ret>"

# Shortcut to quickly exit the editor
define-command -docstring "save and quit" x "write-all; quit"

# Tab completion ^______^ (mawww/kakoune#1327)
hook global InsertCompletionShow .* %{
    try %{
        # this command temporarily removes cursors preceded by whitespace;
        # if there are no cursors left, it raises an error, does not
        # continue to execute the mapping commands, and the error is eaten
        # by the `try` command so no warning appears.
        execute-keys -draft 'h<a-K>\h<ret>'
        map window insert <tab> <c-n>
        map window insert <s-tab> <c-p>
        hook -once -always window InsertCompletionHide .* %{
            map window insert <tab> <tab>
            map window insert <s-tab> <s-tab>
        }
    }
}

# Init plugins
source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "occivink/kakoune-filetree"
plug "andreyorst/smarttab.kak" defer smarttab %{
  # these languages will use `expandtab' behavior
  set-option global softtabstop 2
} config %{
  hook global WinSetOption filetype=(ruby|javascript|typescript|kak|sh|markdown) expandtab
}
