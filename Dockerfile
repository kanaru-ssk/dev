FROM ubuntu

ARG HOST_PWD
WORKDIR $HOST_PWD

SHELL ["bash", "-c"]

# install basic packages
RUN apt update \
  && apt install -y \
    curl \
    git \
    unzip \
    # dependencies of ruby. see https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
    autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

# set up git
RUN git config --global user.name kanaru-ssk \
  && git config --global user.email kanaru.ssk@gmail.com \
  && git config --global init.defaultBranch main \
  && git config --global pull.rebase false

# install docker cli
RUN install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc \
	&& chmod a+r /etc/apt/keyrings/docker.asc \
	&& echo \
		"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
		$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		tee /etc/apt/sources.list.d/docker.list > /dev/null \
	&& apt update \
	&& apt install -y docker-ce-cli

# install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 \
  && echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc \
  && . $HOME/.asdf/asdf.sh \
  # install golang
  && asdf plugin add golang \
  && asdf install golang latest \
  && asdf global golang latest \
  # install nodejs
  && asdf plugin add nodejs \
  && asdf install nodejs latest \
  && asdf global nodejs latest \
  # install ruby
  && asdf plugin add ruby \
	&& asdf install ruby latest \
	&& asdf global ruby latest

CMD ["bash"]