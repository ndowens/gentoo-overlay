# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Init scripts for dinit"
HOMEPAGE="https://git.disroot.org/ndowens/gentoo-dinit"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-init/dinit"
RDEPEND="${DEPEND}"
S="${WORKDIR}/gentoo-dinit"

src_compile() {
	emake
}

src_install() {
	emake DESTDIR=$D install
}
