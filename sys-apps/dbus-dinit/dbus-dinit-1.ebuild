# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dinit script for dbus"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/dinit"
RDEPEND="${DEPEND}"
S=${FILESDIR}

src_install() {
	install -Dm644 dbus{,-pre} -t ${D}/etc/dinit.d
	install -Dm755 dbus-pre.script ${D}/etc/dinit.d/scripts/dbus-pre
}
