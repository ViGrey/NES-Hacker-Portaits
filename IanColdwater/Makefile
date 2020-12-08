# Copyright (C) 2020, Vi Grey
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

PKG_NAME := IanColdwater
CURRENTDIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

all:
	mkdir -p $(CURRENTDIR)bin/build; \
	mkdir -p $(CURRENTDIR)build/$(PKG_NAME)/src; \
  cd $(CURRENTDIR)src; \
  asm $(PKG_NAME).asm ../build/partial.nes; \
  cd $(CURRENTDIR); \
  cp -r src build/$(PKG_NAME); \
  cp LICENSE build/$(PKG_NAME); \
  cp Makefile build/$(PKG_NAME); \
  cp README.md build/$(PKG_NAME); \
  cp SHA256SUMS.txt build/$(PKG_NAME); \
  cd $(CURRENTDIR)build; \
  zip -r $(PKG_NAME).zip $(PKG_NAME); \
  ZIPSIZE=$$(stat -L -c %s $(PKG_NAME).zip); \
  head -c $$((32778 - $$ZIPSIZE)) partial.nes > partial.zip; \
  cat $(PKG_NAME).zip >> partial.zip; \
  zip -F partial.zip --out partial-new.zip; \
  tail -c 8198 partial.nes >> partial-new.zip; \
  cp partial-new.zip $(CURRENTDIR)/bin/build/$(PKG_NAME).nes; \

clean:
	rm -rf -- $(CURRENTDIR)build; \
	rm -rf -- $(CURRENTDIR)bin/build; \
