setup ()
{
	. "${GITSUP_BASE_DIR}/git-sup"
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

test_version_through_short_option ()
{
	git-sup -v > /dev/null

	[ "$?" = "0" ]
}

test_version_through_long_option ()
{
	git-sup --version > /dev/null

	[ "$?" = "0" ]
}

test_help_through_short_option ()
{
	git-sup -h > /dev/null

	[ "$?" = "0" ]
}

test_help_through_long_option ()
{
	git-sup --help > /dev/null

	[ "$?" = "0" ]
}
