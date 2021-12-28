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

_PN="${PN//-dinit/}"

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
	local scriptdir="$(dinit_scriptdir)"
	exeinto $scriptdir
	newexe $1 ${1//-dinit}
}

dinit_install_config() {
	local conf="$1"
	local confdir="$(dinit_confdir)"

	insinto "$confdir"
	newins "$conf" "$conf"
}

src_install() {
	local servicedir="$(dinit_servicedir)"
	PP=$(find . -type f)
	case $PP in 
		sshd)
		echo "Found file";;
	esac
	insinto "$servicedir"
	if [ -f "${_PN}" ]; then
		doins ${_PN}
	elif [ -f ${_PN}d ]; then
		doins ${_PN}d
	elif [ -f "${FILESDIR}/${_PN}d" ]; then
		doins ${FILESDIR}/${_PN}d
	elif [ -f "${_PN}d" ]; then
		doins ${_PN}d
	elif [ -f "${_PN}" ]; then
		doins ${_PN}
	fi

	exeinto "$(dinit_scriptdir)"
	if [ -f "${_PN}.script" ]; then
		newexe "${_PN}.script" "${_PN}"
	elif [ -f "trunk/${_PN}d.script" ]; then
		newexe "trunk/${_PN}d.script" "${_PN}d"
	elif [ -f "trunk/${_PN}.script" ]; then
		newexe "trunk/${_PN}.script" "${_PN}"
	elif [ -f "${FILESDIR}/${_PN}d.script" ]; then
		newexe "${FILESDIR}/${_PN}d.script" "${_PN}d"
	elif [ -f "${_PN}d.script" ]; then
		newexe "${_PN}d.script" "${_PN}d"
	fi

	insinto "$(dinit_confdir)"
	if [ -f "${_PN}.conf" ]; then
		newins "${_PN}.conf" ${_PN}
	elif [ -f "trunk/${_PN}.conf" ]; then
		newins "${_PN}.conf" "${_PN}"
	elif [ -f "${FILESDIR}/${_PN}.conf" ]; then
		newins "${FILESDIR}/${_PN}.conf" "${_PN}"
	fi
}
