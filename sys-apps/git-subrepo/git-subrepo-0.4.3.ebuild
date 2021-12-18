# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit bash-completion-r1

DESCRIPTION="git-submodule alternative"
HOMEPAGE="https://github.com/ingydotnet/git-subrepo"
SRC_URI="${HOMEPAGE}/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

DEPEND="dev-vcs/git"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/shellcheck-bin"
PATCHES=("${FILESDIR}/index-filter.patch")

src_install() {
	make INSTALL_LIB=${D}/usr/libexec/git-core PREFIX=${D}/usr install

	newbashcomp share/completion.bash ${PN}
	install -D -m0644 "share/zsh-completion/_git-subrepo" \
		"${D}/usr/share/zsh/site-functions/_git-subrepo"
}

