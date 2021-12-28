# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit  dinit-r2
DESCRIPTION="Cron scheduling app"
HOMEPAGE="https://expl.info/xwiki/bin/view/Projects/HCRON"
SRC_URI="https://bitbucket.org/hcron/hcron/get/v${PV}.tar.gz"

LICENSE="GPL-2.0-only"
SLOT="0"
KEYWORDS="amd64"

src_unpack() {
	default
	mv ${WORKDIR}/hcron-{hcron-*,${PV}}
}

src_install() {
	emake INSTALL_DIR=$D install
}
