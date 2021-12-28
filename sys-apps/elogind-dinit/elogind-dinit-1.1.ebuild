# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 dinit-r2
DESCRIPTION="Dinit script for elogind"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesE/elogind-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		sys-apps/dbus-dinit
		sys-auth/elogind"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's@lib@lib64@' trunk/elogind
}
