# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: terminal.eclass
# @MAINTAINER:
# Nathan <ndowens@artixlinux.org>
# @AUTHOR:
# Nathan <ndowens@artixlinux.org>
# @SUPPORTED_EAPIS: 8
# @BLURB: 
# @DESCRIPTION: Eclass for eselect

install_eselect_module() {
	install -Dm644 "$1" -t /usr/share/eselect/modules
}
