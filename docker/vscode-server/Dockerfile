FROM codercom/code-server:latest

ENV GOLANG_VERSION 1.14.3

ENV LANG C.UTF-8

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN set -eux && \
    sudo apt-get update && \
    sudo apt install -y \
	  xz-utils \
      autoconf \
      dpkg-dev \
      file \
      g++ \
      gcc \
      git \
      libc-dev \
      libc6-dev \
      make \
      mc \
      perl \
      pkg-config \
      php-common php-cli php-json php-pdo php-mysql php-zip php-gd  php-mbstring php-curl php-xml php-pear php-bcmath \
      python3-pip \
      re2c \
      rsync \
      ruby-full \
      tmux \
      vim \
      wget \
      zip unzip \
      ca-certificates p11-kit curl apt-transport-https lsb-release gnupg && \
# google-cloud-sdk + kubectl
    sudo echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    sudo apt-get update && sudo apt-get install -y google-cloud-sdk  google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-go kubectl && \
# azure-cli
    sudo curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null  && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list && \
    sudo apt-get update && \
    sudo apt-get install azure-cli && \
    sudo rm -rf /var/lib/apt/lists/* && \
# awscli jupyter
    pip3 install  awscli jupyter
# sdkman
RUN sudo wget -q -O sdk.install.sh "https://get.sdkman.io" && \
    sudo bash sdk.install.sh && \
    sudo chmod +x /root/.sdkman/bin/sdkman-init.sh && \
    sudo rm -rf sdk.install.sh

# oc 3.11
RUN sudo wget -q https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
    sudo tar -zxf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
    cd openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit  && \
    sudo mv oc /usr/local/bin/ && \
    cd .. && \
    sudo rm -rf openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz

# go
RUN set -eux; \
	\
# this "case" statement is generated via "update.sh"
	dpkgArch="$(dpkg --print-architecture)"; \
	case "${dpkgArch##*-}" in \
		amd64) goRelArch='linux-amd64'; goRelSha256='1c39eac4ae95781b066c144c58e45d6859652247f7515f0d2cba7be7d57d2226' ;; \
		armhf) goRelArch='linux-armv6l'; goRelSha256='b1c3a648c3c8877b98dfba1996dec604c8fb8899db07994b2dfd47b0063367c8' ;; \
		arm64) goRelArch='linux-arm64'; goRelSha256='a7a593e2ee079d83a1943edcd1c9ed2dae7529666fce04de8c142fb61c7cdd3e' ;; \
		i386) goRelArch='linux-386'; goRelSha256='46f8c744788103e8aeceb12c7d71eb16a58fe43e7e4711055fa9ef4bae50bff7' ;; \
		ppc64el) goRelArch='linux-ppc64le'; goRelSha256='329359e2b72839696e78b6c0a96fd939e28e7435d852f31107f68037dd5f7442' ;; \
		s390x) goRelArch='linux-s390x'; goRelSha256='1aad312fc7fa85d663e8226237cc7519b2599b88a213098abc10de8e84d6cfab' ;; \
		*) goRelArch='src'; goRelSha256='93023778d4d1797b7bc6a53e86c3a9b150c923953225f8a48a2d5fabc971af56'; \
			echo >&2; echo >&2 "warning: current architecture ($dpkgArch) does not have a corresponding Go binary release; will be building from source"; echo >&2 ;; \
	esac; \
	\
	url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
	sudo wget -q -O go.tgz "$url"; \
	echo "${goRelSha256} *go.tgz" | sha256sum -c -; \
	sudo tar -C /usr/local -xzf go.tgz; \
	sudo rm go.tgz; \
	\
	if [ "$goRelArch" = 'src' ]; then \
		echo >&2; \
		echo >&2 'error: UNIMPLEMENTED'; \
		echo >&2 'TODO install golang-any from jessie-backports for GOROOT_BOOTSTRAP (and uninstall after build)'; \
		echo >&2; \
		exit 1; \
	fi; \
	\
	export PATH="/usr/local/go/bin:$PATH"; \
	go version ; \
    sudo mkdir -p "$GOPATH/src" "$GOPATH/bin" && sudo chmod -R 777 "$GOPATH"
