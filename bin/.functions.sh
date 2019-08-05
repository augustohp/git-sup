#!/usr/bin/env bash
#
# Front controller for every script in this directory, aiming to ease their
# composition.
# Utility functions for other scripts. Avoiding functions when idiomatic shell
# is better suited.
#
# Author: Augusto Pascutti <augusto.hp+oss@gmail.com>

# Declare $DEBUG variable to enable debugging everywhere
test ! -z "$DEBUG" && { set -x; }

PATH=$PATH:$APP_DIR

# Usage: assert_dependency_exists <command> [error code]
assert_dependency_exists()
{
	test_subject=$1
	error_code=${2:-2}

	if [ -z "$(command -v $1)" ]
	then
		echo "Error: Missing dependency '$test_subject'" >&2
		exit $error_code
	fi

	return 0
}
