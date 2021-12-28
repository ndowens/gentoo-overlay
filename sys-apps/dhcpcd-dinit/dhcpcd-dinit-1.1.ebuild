# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit-r2 git-r3
DESCRIPTION="Dinit script for dhcpcd"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesD/dhcpcd-dinit.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		net-misc/dhcpcd"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's@/usr/bin@/sbin@' trunk/dhcpcd
}
