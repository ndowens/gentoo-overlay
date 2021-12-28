# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Alternative to sysd timer"
HOMEPAGE="https://github.com/leahneukirchen/snooze"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz"

LICENSE="PD"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	emake PREFIX=/usr DESTDIR=$D install
}
