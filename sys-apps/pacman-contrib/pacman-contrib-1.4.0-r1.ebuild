# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Extra scripts for pacman"
HOMEPAGE="https://gitlab.archlinux.org/pacman/pacman-contrib"
SRC_URI="https://gitlab.archlinux.org/pacman/pacman-contrib/-/archive/v${PV}/pacman-contrib-v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-apps/fakeroot sys-devel/pacman virtual/perl6"
RDEPEND="${DEPEND}"
BDEPEND="app-text/asciidoc"

PATCHES=("${FILESDIR}/0001-pactree-fix-compilation-with-pacman-6.patch"
		 "${FILESDIR}/rankmirrors-artix.patch")
S="${WORKDIR}/pacman-contrib-v${PV}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	default
}

src_install() {
	default
	rm -rf "${D}"/usr/lib64/systemd
}
