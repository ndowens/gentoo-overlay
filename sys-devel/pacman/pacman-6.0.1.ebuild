# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Archlinux's package manager"
HOMEPAGE="https://archlinux.org/pacman"
SRC_URI="https://sources.archlinux.org/other/pacman/${PN}-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-shells/bash sys-libs/glibc
		app-arch/libarchive net-misc/curl
		app-crypt/gpgme"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson"
PATCHES=("${FILESDIR}/extracolors.patch")

src_compile() {
	meson \
		--prefix=/usr \
		--buildtype=plain \
		-Ddoc=disabled \
		-Ddoxygen=disabled \
		-Dscriptlet-shell=/bin/bash \
		-Dldconfig=/sbin/ldconfig \
		build
	meson compile -C build
}

src_install() {
	DESTDIR=${D} meson install -C build
}
