.PHONY: alacritty brew brew-install devbox direnv git languages nvim os prettierd starship stow tmux xcode zed zellij zsh
default: .PHONY

alacritty: brew-install
	@chmod +x alacritty/install.sh
	@./alacritty/install.sh

brew: brew-install
	@chmod +x brew/bundle.sh
	@./brew/bundle.sh

brew-install: xcode
	@chmod +x brew/install.sh
	@./brew/install.sh

devbox:
	@chmod +x devbox/install.sh
	@./devbox/install.sh

direnv: brew-install stow
	@chmod +x direnv/install.sh
	@./direnv/install.sh

ghostty: brew-install
	@chmod +x ghostty/install.sh
	@./ghostty/install.sh

git: stow
	stow git

languages: brew-install
	echo "Installing SDKMAN..."
	@chmod +x languages/sdkman.sh
	@./languages/sdkman.sh
	@chmod +x languages/other.sh
	@./languages/other.sh

nvim: brew-install stow
	@chmod +x nvim/install.sh
	@./nvim/install.sh

os:
	@chmod +x os/install.sh
	@./os/install.sh

prettierd: stow
	stow prettierd

starship: brew-install stow
	@chmod +x starship/install.sh
	@./starship/install.sh

stow: brew-install
	stow stow

tmux: brew-install stow
	@chmod +x tmux/install.sh
	@./tmux/install.sh

xcode:
	echo "Installing Xcode (takes a while)..."
	@xcode-select --install || true

zed: brew
	stow zed

zellij: brew-install stow
	@chmod +x zellij/install.sh
	@./zellij/install.sh

zsh: stow
	@chmod +x zsh/install.sh
	@./zsh/install.sh
