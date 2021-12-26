# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit git-r3
DESCRIPTION="Dinit script for sddm"
EGIT_REPO_URI="https://gitea.artixlinux.org/packagesS/sddm-dinit"
LICENSE="GPL-2.0-only"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit"

src_install() {
	dinit_install_service trunk/sddm
	dinit_install_script trunk/sddm.script sddm
}
