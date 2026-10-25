STOW_DIR := $(HOME)/dotfiles
TARGET := $(HOME)

PACKAGES := nvim bash tmux git ghostty
SUBMODULES :=

-include local.mk

ifdef PMG_WORK
	SUBMODULES += pmg_work
endif

.PHONY: stow unstow restow

stow:
	cd $(STOW_DIR) && stow --target=$(TARGET) $(PACKAGES)

unstow:
	cd $(STOW_DIR) && stow --delete --target=$(TARGET) $(PACKAGES)

restow:
	cd $(STOW_DIR) && stow --restow --target=$(TARGET) $(PACKAGES)

submodules:
	@for sm in $(SUBMODULES); do git submodule update --init $$sm; done
