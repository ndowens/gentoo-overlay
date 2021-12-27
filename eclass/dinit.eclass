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
	doins "$service"
}

dinit_install_script() {
	local script="$1"
	local scriptname="$2"
	local scriptdir="${D}$(dinit_scriptdir)"
	install -Dm755 "$1" "${scriptdir}/$2"
}

dinit_install_config() {
	local conf="$1"
	local confdir="$(dinit_confdir)"

	insinto "$confdir"
	newins "$conf" "$conf"
}

src_install() {
	local servicedir="$(dinit_servicedir)"

	insinto "$servicedir"
	doins "${PN/-dinit/}"
	if [ -f "${PN/-dinit/}.script" ]; then
		insinto "$(dinit_scriptdir)"
		newexe "${PN/-dinit}.script" "${PN/-dinit}"
	fi

	if [ -f "${PN/-dinit/}.conf" ]; then
		insinto "$(dinit_confdir)"
		newins "${PN/-dinit/}.conf" ${PN/-dinit}
	fi
}
