Currently in alpha version. Please subscribe to new releases to be notified about breaking changes.

[Tmux](https://github.com/tmux/tmux/wiki) [plugin](https://github.com/tmux-plugins/tpm) for [mite-cli](https://github.com/Ephigenia/mite-cli) which can show current tracking status, tracked duration and revenue of today or the whole month in your tmux status bar.

## Variables

- `mite_month_revenue` the current month’s revenue
- `mite_month_duration` the current month’s duration
- `mite_status` current tracker status, shows currently tracked duration
- `mite_today_duration` todays total duration
- `mite_today_revenue` todays revenue

## Install

### With [tpm](https://github.com/tmux-plugins/tpm)

Add the following line to your `~/.tmux.conf`:

    set -g @plugin 'robhurring/tmux-spotify'

Reload plugins with <key>prefix</key>+<key>I</key>

### Manual Installation

Clone the source directly to the plugins directory

    git clone git@github.com:Ephigenia/tmux-mite-cli.git ~/.tmux/plugins

Add the plugin to the tmux configuration
    
    run-shell ~/.tmux/plugins/tmux-mite-cli/mite-cli.tmux

Restart tmux

### Setup

The variables can be added to the left or right status line. See the example which adds all variables to the left status bar:

    set -g status-left 'mite: #{mite_status} #{mite_today_duration} (#{mite_today_revenue}) / #{mite_month_duration} (#{mite_month_revenue})'

Reload tmux <key>prefix</key>+<key>r</key> config or restart.