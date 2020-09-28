#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
	mite list this-month --format=text --columns=revenue --group-by month | head -n 2 | tail -n 1
}
main