STOW_DIR := $(HOME)/dotfiles
TARGET := $(HOME)

PACKAGES := nvim bash tmux git ghostty
SUBMODULES :=
STOW_FLAGS := --no-folding --target=$(TARGET)

-include local.mk

ifdef PMG_WORK
	SUBMODULES += pmg_work
endif

.PHONY: stow unstow restow

stow:
	cd $(STOW_DIR) && stow $(STOW_FLAGS) $(PACKAGES)

unstow:
	cd $(STOW_DIR) && stow --delete $(STOW_FLAGS) $(PACKAGES)

restow:
	cd $(STOW_DIR) && stow --restow $(STOW_FLAGS) $(PACKAGES)

submodules:
	@for sm in $(SUBMODULES); do git submodule update --init $$sm; done
