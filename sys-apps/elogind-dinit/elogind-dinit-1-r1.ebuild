# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dinit script for elogind"
HOMEPAGE="https://github.com/ndowens/gentoo-overlay"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/dinit
		sys-apps/dbus-dinit"
RDEPEND="${DEPEND}"
S="${FILESDIR}"

src_install() {
	install -Dm644 elogind -t "$D"/etc/dinit.d
	install -Dm755 elogind-script "$D"/etc/dinit.d/scripts/elogind
}
