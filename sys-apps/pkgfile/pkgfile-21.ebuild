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

DEPEND="app-arch/libarchive
	   net-misc/curl"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson
	    sys-devel/clang"
S="${WORKDIR}/${PN}-${PV}"
