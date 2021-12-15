# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: dinit.eclass
# @MAINTAINER:
# Nathan <ndowens@artixlinux.org>
# @AUTHOR:
# Nathan <ndowens@artixlinux.org>
# @SUPPORTED_EAPIS: 8
# @BLURB: helper function to install dinit services 
# @DESCRIPTION: This eclass provides helper to install dinit services

if [[ ! ${_DINIT_ECLASS} ]]; then

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI} unsupported."
esac

_DINIT_ECLASS=1
fi

dinit_servicedir() {
	echo /etc/dinit.d
}

dinit_scriptdir() {
	echo /etc/dinit.d/scripts
}

dinit_confdir() {
	echo /etc/dinit.d/config
}

dinit_install_service() {
	local service="$1"

	local servicedir="$(dinit_servicedir)"
	insinto "$servicedir"
	newins "$service" "$service"
}

dinit_install_script() {
	local script="$1"
	local scriptdir="$(dinit_scriptdir)"
	exeinto "$scriptdir"
	newexe "$script" "$script"
}

dinit_install_config() {
	local conf="$1"
	local confdir="$(dinit_confdir)"

	insinto "$confdir"
	newins "$conf" "$conf"
}
