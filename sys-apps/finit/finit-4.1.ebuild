# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Finit init system"
HOMEPAGE="https://github.com/troglobit/finit"
SRC_URI="https://github.com/troglobit/finit/releases/download/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="dev-libs/libite
		dev-libs/libuev"
RDEPEND="${DEPEND}"

src_configure() {
	./configure \
		--prefix=/usr \
		--sbindir=/sbin \
		--enable-auto-reload \
		--enable-modules-load-plugin \
		--enable-x11-common-plugin
}
