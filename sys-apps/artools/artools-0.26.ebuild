# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Artixlinux packaging tools"
HOMEPAGE="https://gitea.artixlinux.org/artix/artools"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

DEPEND="dev-vcs/git
		sys-apps/git-subrepo
		net-misc/rsync"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_install() {
	make PREFIX=/usr DESTDIR=${D} install_base install_pkg
}
