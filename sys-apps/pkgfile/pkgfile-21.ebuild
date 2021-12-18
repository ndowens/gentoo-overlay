# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson
DESCRIPTION="Find package ownership"
HOMEPAGE="https://github.com/falconindy/pkgfile"
SRC_URI="https://github.com/falconindy/pkgfile/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="systemd"
DEPEND="app-arch/libarchive
	   net-misc/curl"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson
	    sys-devel/clang"
S="${WORKDIR}/${PN}-${PV}"

src_configure() {
	local emesonargs=(
		$(meson_use systemd systemd_units)
		)
	meson_src_configure
}

pkg_postinst() {
	keepdir /var/cache/pkgfile
}
