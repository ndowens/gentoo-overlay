# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit git-r3
DESCRIPTION="Dinit script for lxd"
EGIT_REPO_URI="https://gitea.artixlinux.org/packagesL/lxd-dinit.git"

LICENSE="GPL-2.0-only"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		app-containers/lxd"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's:/usr/bin:/usr/sbin:g' trunk/lxd.script
}

src_install() {
	dinit_install_service trunk/lxd
	dinit_install_script trunk/lxd.script lxd
}
