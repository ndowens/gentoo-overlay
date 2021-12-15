# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dinit

DESCRIPTION="Dinit script for wireguard"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/dinit
		net-vpn/wireguard-tools"
RDEPEND="${DEPEND}"
S="$FILESDIR"

src_install() {
	dinit_install_service wireguard
}
