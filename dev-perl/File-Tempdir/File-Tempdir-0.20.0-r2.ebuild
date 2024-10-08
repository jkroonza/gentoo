# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DIST_AUTHOR=NANARDON
DIST_VERSION=0.02
inherit perl-module

DESCRIPTION="Provides an object interface to tempdir() from File::Temp"

SLOT="0"
KEYWORDS="~alpha amd64 ppc sparc x86"

BDEPEND="
	virtual/perl-ExtUtils-MakeMaker
"
