STOW_DIR := $(HOME)/dotfiles
TARGET := $(HOME)

PACKAGES := nvim bash

.PHONY: stow unstow restow

stow:
	cd $(STOW_DIR) && stow --target=$(TARGET) $(PACKAGES)

unstow:
	cd $(STOW_DIR) && stow --delete --target=$(TARGET) $(PACKAGES)

restow:
	cd $(STOW_DIR) && stow --restow --target=$(TARGET) $(PACKAGES)
