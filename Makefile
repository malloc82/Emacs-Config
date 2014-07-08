SHELL := /bin/bash
OS    := $(shell uname -s 2>/dev/null | tr [:upper:] [:lower:])
ifeq ($(OS), linux)
	EMACS := /usr/local/bin/emacs-24.3
else ifeq ($(OS), darwin)
	EMACS := /Applications/Emacs\ 24.3.app/Contents/MacOS/Emacs
else
	ERR := $(error os is not supported)
endif

CONFIG_DIR := ~/.emacs.d/
FONT_DIR   := /usr/share/fonts/truetype/custom
install-linux-fonts:
	if [ "$(OS)" == "linux" ]; then \
		sudo mkdir -p $(FONT_DIR); \
		sudo find ~/.emacs.d/fonts/ -type f -iname "*.ttf" -exec cp -t $(FONT_DIR) '{}' + ; \
		sudo fc-cache -f -v; \
	fi
setup:
	mkdir -p ~/.emacs.d/snippets/
byte-compile-directory:
	$(EMACS) --batch --eval '(byte-recompile-directory "$(CONFIG_DIR)" 0)'
clean:
	find $(CONFIG_DIR) -type f -iname "*.elc" -exec rm {} +
test:
	@echo $(OS)
	@echo $(EMACS)
.PHONY: err
err: ; $(ERR)

# install:
# 	cp init.el ~/.emacs
