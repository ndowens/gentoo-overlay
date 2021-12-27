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
	case "${WORKDIR}" in
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
			doins trunk/sshd
			;;
	esac

	exeinto "$(dinit_scriptdir)"
	case "${WORKDIR}" in
		"${_PN}.script" )
			newexe "${_PN}.script" "${_PN}"
			;;
		"trunk/${_PN}d.script" )
			newexe "trunk/${_PN}d.script" "${_PN}d"
			;;
		"${FILESDIR}/${_PN}d.script")
			newexe "${FILESDIR}/${_PN}d.script" "${_PN}d"
			;;
		"${_PN}d.script" )
			newexe "${_PN}d.script" "${_PN}d"
			;;
		# openssh
		trunk/sshd.script )
			newexe trunk/sshd.script sshd
			;;
	esac

	insinto "$(dinit_confdir)"
	case "${WORKDIR}" in
		"${_PN}.conf")
			newins "${_PN}.conf" ${_PN}
			;;
		"trunk/${_PN}.conf")
			newins "${_PN}.conf" "${_PN}"
			;;
		"${FILESDIR}/${_PN}.conf")
			newins "${FILESDIR}/${_PN}.conf" "${_PN}"
			;;
	esac
}
