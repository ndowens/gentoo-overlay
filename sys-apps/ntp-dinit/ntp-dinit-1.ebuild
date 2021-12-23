# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit
DESCRIPTION="ntp script for dinit"
SRC_URI="https://gitea.artixlinux.org/packagesN/ntp-dinit/raw/branch/master/trunk/ntpd"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		net-misc/ntp"
RDEPEND="${DEPEND}"
S="${WORKDIR}/../distdir"

src_install() {
	dinit_install_service ntpd
}
