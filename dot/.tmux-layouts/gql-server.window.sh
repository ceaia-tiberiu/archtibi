# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/dev/giffgaff/graphql-server/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "graphql"

# Split window into panes.
split_v 50
split_h 50

# Run commands.
run_cmd "htop"     # runs in active pane
run_cmd "date" 2  # runs in pane 2

# Set active pane.
select_pane 1
