# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Dinit service for chrony"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="net-misc/chrony
		sys-apps/dinit"
S="$FILESDIR"

src_install() {
	install -Dm644 chronyd -t ${D}/etc/dinit.d
}
