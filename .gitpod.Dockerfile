FROM gitpod/workspace-full

LABEL org.opencontainers.image.title="Gitpod Enhanced"
LABEL org.opencontainers.image.description="Gitpod Workspace image, built on gitpod/workspace-full."
LABEL org.opencontainers.image.author="Jery Thomas <me@jerrythomas.name>"
LABEL org.opencontainers.image.source="https://github.com/jerrythomas/gitpod-enhanced"
LABEL org.opencontainers.image.license="MIT"
LABEL repository="https://github.com/jerrythomas/gitpod-enhanced"
LABEL maintainer="jerrythomas"

WORKDIR /home/gitpod

# update system packages and cleanup cache
ARG DEBIAN_FRONTEND=noninteractive
RUN sudo install-packages zsh \
	&& chsh -s /bin/zsh

USER gitpod

# update/upgrade/cleanup homebrew packages
RUN brew update \
	&& brew upgrade \
	&& brew cleanup \
	&& brew install spaceship pnpm nvm \
	&& echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc \
	&& chsh -s /bin/zsh