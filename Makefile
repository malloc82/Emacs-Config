OS := $(shell uname -s 2>/dev/null | tr [:upper:] [:lower:])
ifeq ($(OS), linux)
	EMACS := /usr/local/bin/emacs-24.3
else ifeq ($(OS), darwin)
	EMACS := /Applications/Emacs\ 24.3.app/Contents/MacOS/Emacs
else
	ERR := $(error os is not supported)
endif

DIR   := ~/.emacs.d/

byte-compile-directory:
	$(EMACS) --batch --eval '(byte-recompile-directory "$(DIR)" 0)'
clean:
	find $(DIR) -type f -iname "*.elc" -exec rm {} +
test:
	@echo $(OS)
	@echo $(EMACS)
.PHONY: err
err: ; $(ERR)

# install:
# 	cp init.el ~/.emacs

