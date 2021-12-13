# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dinit init system"
HOMEPAGE="https://github.com/davmac314/dinit"
SRC_URI="https://github.com/davmac314/dinit/releases/download/v${PV}/dinit-${PV}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
BDEPEND="sys-devel/m4"

src_install() {
	emake PREFIX=/usr SBINDIR=/sbin DESTDIR=${D} install
	rm -rf ${D}/usr/share/man
}
