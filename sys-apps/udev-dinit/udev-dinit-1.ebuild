# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dinit script for udev"
HOMEPAGE="https://github.com/ndowens/gentoo-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit"
RDEPEND="${DEPEND}"
S="${FILESDIR}"

src_install() {
	local f
	for f in ${FILESDIR}/* ; do
		install -Dm644 $f -t ${D}/etc/dinit.d
	done
}
