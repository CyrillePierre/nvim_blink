FROM debian:latest

# install dependencies
RUN --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      git python3-venv nodejs unzip xclip fd-find ripgrep jq strace ltrace \
      ninja-build gettext cmake curl build-essential && \
    rm -rf /var/lib/apt/lists/*

# compile neovim
RUN cd /tmp && \
    git clone --depth 1 -b stable https://github.com/neovim/neovim ; \
    cd neovim && \
    make -j CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make install && \
    cd .. && \
    rm -rf neovim

# install dependencies for musicbotd and others
RUN --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      libcurl3-gnutls-dev libmpv-dev && \
    rm -rf /var/lib/apt/lists/*
