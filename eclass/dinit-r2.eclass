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
	exeinto $(dinit_scriptdir)
	newexe "$1" "${1//-dinit/}"
}

dinit_install_config() {
	local conf="$1"
	local confdir="$(dinit_confdir)"

	insinto "$confdir"
	newins "$conf" "$conf"
}

src_install() {
	local servicedir="$(dinit_servicedir)"
	SF=$( [ -f ${S} ]; then )
	insinto "$servicedir"
	case " ${SF})" in
		"trunk/${_PN}")
			doins trunk/${_PN}
			;;
		"trunk/${_PN}d" )
			doins trunk/${_PN}d
			;;
		"${FILESDIR}/${_PN}d" )
			doins ${FILESDIR}/${_PN}d
			;;
		"${_PN}d" )
			doins ${_PN}d
			;;
		"${_PN}" )
			doins ${_PN}
			;;
		# openssh
		trunk/sshd )
			doins ${S}/trunk/sshd
			;;
	esac

	exeinto "$(dinit_scriptdir)"
	case "${S}" in
		"${_PN}.script" )
			newexe "${S}/${_PN}.script" "${_PN}"
			;;
		"trunk/${_PN}d.script" )
			newexe "${S}/trunk/${_PN}d.script" "${_PN}d"
			;;
		"${FILESDIR}/${_PN}d.script")
			newexe "${FILESDIR}/${_PN}d.script" "${_PN}d"
			;;
		"${_PN}d.script" )
			newexe "${S}/${_PN}d.script" "${_PN}d"
			;;
		# openssh
		trunk/sshd.script )
			newexe ${S}/trunk/sshd.script sshd
			;;
	esac

	insinto "$(dinit_confdir)"
	case "${S}" in
		"${_PN}.conf")
			newins "${S}/${_PN}.conf" ${_PN}
			;;
		"trunk/${_PN}.conf")
			newins "${S}/${_PN}.conf" "${_PN}"
			;;
		"${FILESDIR}/${_PN}.conf")
			newins "${FILESDIR}/${_PN}.conf" "${_PN}"
			;;
	esac
}
