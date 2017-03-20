FROM ubuntu:latest
MAINTAINER Wei Xu <xuwei04@gmail.com>

RUN apt-get update && apt-get install  -y \
	build-essential \
	git \
	vim \
	tmux \
	cscope \
	ctags \
	autoconf \
	libncurses-dev \
	zsh \
	wget \
	tar \
	curl

RUN git clone https://github.com/joyxu/vim-config.git ./vim-config \
	&& cp ./vim-config/.vimrc ~/ \
	&& cp ./vim-config/.tmux.conf ~/ \
	&& cp ./vim-config/tmux.sh ~/

RUN cd /opt && mkdir linaro-arm64-toolchain \
	&& wget -c https://releases.linaro.org/components/toolchain/binaries/latest/aarch64-linux-gnu/gcc-linaro-6.3.1-2017.02-x86_64_aarch64-linux-gnu.tar.xz \
	&& tar -xJf gcc-* -C /opt/linaro-arm64-toolchain --strip-components=1 \
	&& rm *.tar.xz \
	&& cd ~/

RUN echo 'export PATH=/opt/linaro-arm64-toolchain/bin:$PATH' >> $HOME/.bashrc

RUN curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -

RUN echo 'export PATH=/opt/linaro-arm64-toolchain/bin:$PATH' >> $HOME/.zshrc

CMD ["zsh"]
