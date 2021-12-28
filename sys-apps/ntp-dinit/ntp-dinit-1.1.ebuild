# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit-r2 git-r3
DESCRIPTION="ntp script for dinit"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesN/ntp-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		net-misc/ntp"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's@bin@sbin@' trunk/ntpd
}
