#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	mite list --limit 1 --tracking yes --format=text --columns=duration | head -2 | tail -1
}
main