# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dinit-r2 git-r3
DESCRIPTION="Dinit service for chrony"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesC/chrony-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-misc/chrony
		sys-apps/dinit"

src_prepare() {
	sed -i 's@bin@sbin@' trunk/chronyd
}
