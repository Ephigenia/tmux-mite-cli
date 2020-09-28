#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	mite list today --format=text --columns=duration --group-by day | head -n 2 | tail -n 1
}
main