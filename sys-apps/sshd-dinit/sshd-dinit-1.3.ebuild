# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit dinit-r1 git-r3

DESCRIPTION="Dinit script for openssh"

EGIT_REPO_URI="https://gitea.artixlinux.org/packagesO/openssh-dinit.git"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-apps/dinit
		net-misc/openssh"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's@bin/sshd@sbin/sshd@' trunk/sshd.script
}
