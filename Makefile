# Makefile for ha-tools
# http://github.com/joekhoobyar/ha-tools
#
# Author:		Joe Khoobyar <joe@ankhcraft.com>
# License:	GNU General Public License (GPL) version 2
# Copyright (c) 2009 All Rights Reserved
#
PREFIX = /usr/local
GROUP = root
TOOLS = crm_hostname cib_failcounts cib_errors ocf_resource
SHARES = resource2variables.xslt

all: check

install: install-all

install-all: gen-tools install-tools install-shares

install-tools: $(addprefix gen/, $(TOOLS))
	install -m 755 -o root -g $(GROUP) $^ $(PREFIX)/sbin

install-shares: $(SHARES)
	install -m 644 -o root -g $(GROUP) $^ $(PREFIX)/share/ha-tools

gen-tools: $(TOOLS)
	mkdir -p gen
	sed -e 's@\$$(dirname \$$0)/@$${HA_TOOLS_SHARE:-$(PREFIX)/share/ha-tools}@g;' <$$i >>gen/$$i

clean:
	rm -rf gen

check:

