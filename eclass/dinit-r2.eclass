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
	local _file 
	local _script
	insinto "$servicedir"

	if [ -d trunk ]; then
		cd trunk
	fi

	for _file in * ; do
		if [ $_file = *.script ]; then
			exeinto $(dinit_scriptdir)
			newexe $_script ${_script//.script/}

		elif [ $_file = ${_PN} ]; then
			insinto $(dinit_servicedir)
			newins $_PN $_PN

		elif [ "$_file" = ${_PN}-pre ]; then
			insinto $(dinit_servicedir)
			newins ${_PN}-pre ${_PN}-pre

		elif [ "$_file" = "${_PN}d" ]; then
			insinto $(dinit_servicedir)
			newins ${_PN}d ${_PN}d

		elif [ "$_file" = "${_PN}d"-pre ]; then
			insinto $(dinit_servicedir)
			newins "${_PN}d"-pre "${_PN}d"-pre

		elif [ $_file = *.conf ] ; then
			insinto $(dinit_confdir)
			newins $_file $_file
		fi
	done
}
