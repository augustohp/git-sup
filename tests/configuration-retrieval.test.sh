export FAKE_REPOSITORY=/tmp/git-sup-test-repo

setup ()
{
	. "${GITSUP_BASE_DIR}/git-sup"
	mkdir "${FAKE_REPOSITORY}"
	cd "${FAKE_REPOSITORY}"
	git init
}

teardown ()
{
	rm -rf "${FAKE_REPOSITORY}"
}

using_git_config ()
{
	fixture_path="${GITSUP_BASE_DIR}/tests/git-config/${1:-}"

	if [ ! -f "${fixture_path}" ];
	then
		echo "Missing fixture ${fixture_path}"
		return 1;
	fi

	destination_path="${FAKE_REPOSITORY}/.git/config"
	cat "${fixture_path}" >> "${destination_path}"
}

test_empty_file_yields_default_fetch_arguments ()
{
	using_git_config empty

	expected="--all"
	result=$(_conf_or sup.fetchargs "--all")

	[ "$expected" = "$result" ]
}

test_fetch_arg_configuration_is_retrieved ()
{
	using_git_config pruning

	expected="--all --prune"
	result=$(_conf_or sup.fetchargs "failed")

	[ "$expected" = "$result" ]
}
