#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

mite_interpolation=(
  "\#{mite_status}"
  "\#{mite_month_duration}"
  "\#{mite_month_revenue}"
  "\#{mite_today_duration}"
  "\#{mite_today_revenue}"
)
mite_commands=(
  "#($CURRENT_DIR/scripts/mite_status.sh)"
  "#($CURRENT_DIR/scripts/mite_month_duration.sh)"
  "#($CURRENT_DIR/scripts/mite_month_revenue.sh)"
  "#($CURRENT_DIR/scripts/mite_today_duration.sh)"
  "#($CURRENT_DIR/scripts/mite_today_revenue.sh)"
)

set_tmux_option() {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local all_interpolated="$1"
  for ((i=0; i<${#mite_commands[@]}; i++)); do
    all_interpolated=${all_interpolated//${mite_interpolation[$i]}/${mite_commands[$i]}}
  done
  echo "$all_interpolated"
}

update_tmux_option() {
  local option=$1
  local option_value=$(get_tmux_option "$option")
  local new_option_value=$(do_interpolation "$option_value")
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
