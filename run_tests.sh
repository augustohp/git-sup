#!/usr/bin/env sh

workshop_repository="https://github.com/Mosai/workshop.git"
workshop_directory=/tmp/mosai-workshop
test_directory=tests
script_dir=$(dirname "$0")

GITSUP_BASE_DIR="$(cd "$script_dir" || exit 2;pwd)"
export GITSUP_BASE_DIR

if [ ! -d "${workshop_directory}" ]
then
	echo "Downloading Mosai/Workshop..."
	mkdir -p "${workshop_directory}"
	git clone "${workshop_repository}" "${workshop_directory}"
fi

export PATH="${PATH}:${workshop_directory}/bin"
chmod a+x "${workshop_directory}/bin/posit"

posit --report=spec run "${test_directory}"
