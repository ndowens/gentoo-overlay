# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dinit-r2 git-r3

DESCRIPTION="Dinit script for fcron"
EGIT_REPO_URI="https://gitea.artixlinux.org/packagesF/fcron-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/fcron
		sys-apps/dinit"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's@bin@libexec@' trunk/fcron
}
