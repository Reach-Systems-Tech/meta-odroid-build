FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
	curl \
	git \
	ca-certificates \
	&& rm -rf /var/lib/apt/lists/*
	
WORKDIR /app

# -- copy over script
COPY init.sh /app/init.sh
RUN chmod +x /app/init.sh

# -- run the script once container starts
CMD ["/app/init.sh"]