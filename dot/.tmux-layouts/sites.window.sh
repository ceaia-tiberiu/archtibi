# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/sites/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "sites"

# Split window into panes.
split_v 50
split_h 50

# Run commands.
# run_cmd "npm run ios" 1    # runs in active pane
# run_cmd "npm run start" 3

# Set active pane.
select_pane 1
