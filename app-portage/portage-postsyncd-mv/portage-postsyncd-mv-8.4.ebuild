# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Post sync hook for portage git"
HOMEPAGE="https://github.com/vaeth/portage-postsyncd-mv"
SRC_URI="https://github.com/vaeth/portage-postsyncd-mv/archive/v${PV}.tar.gz"

LICENSE="GPL-2-only"
SLOT="0"
KEYWORDS="amd64"

src_install() {
	install  -d ${D}/etc/portage/repo.postsync.d \
		${D}/usr/share/zsh/site-functions
	cp repo.postsync.d/* ${D}/etc/portage/repo.postsync.d
	cp zsh/* ${D}/usr/share/zsh/site-functions
}
