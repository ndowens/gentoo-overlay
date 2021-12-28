# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dinit-r2 git-r3

DESCRIPTION="Dinit script for wireguard"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesW/wireguard-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		net-vpn/wireguard-tools"
RDEPEND="${DEPEND}"
