# Makefile for ha-tools
# http://github.com/joekhoobyar/ha-tools
#
# Author:		Joe Khoobyar <joe@ankhcraft.com>
# License:	GNU General Public License (GPL) version 2
# Copyright (c) 2009 All Rights Reserved
#
PREFIX = /usr/local
GROUP = root
TOOLS = cib_failcounts cib_errors

all: check

install: install-all

install-all: install-tools

install-tools: $(TOOLS)
	install -m 755 -o root -g $(GROUP) $^ $(PREFIX)/sbin

clean:

check:

