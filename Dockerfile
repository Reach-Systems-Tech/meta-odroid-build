FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	curl git ca-certificates \
	gawk wget git diffstat unzip texinfo gcc build-essential \
	chrpath socat cpio python3 python3-pip python3-pexpect xz-utils \
	debianutils iputils-ping python3-git python3-jinja2 python3-subunit \
	zstd liblz4-tool file locales libacl1 \
	&& rm -rf /var/lib/apt/lists/* \
	&& locale-gen en_US.UTF-8
	

# -- yocto dont run root >:(
RUN useradd -ms /bin/bash dumi_developer
USER dumi_developer
WORKDIR /home/dumi_developer/yocto-work

# -- run the script once container starts
CMD ["/bin/bash", "-c", "echo 3 | source scripts/init-repo.sh"]