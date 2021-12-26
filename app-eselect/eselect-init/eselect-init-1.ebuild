# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit eselect

DESCRIPTION="Eselect module for init"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
S="${FILESDIR}"

src_install() {
	install_eselect_module init.eselect
}
