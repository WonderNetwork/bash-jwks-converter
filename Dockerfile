FROM ubuntu:26.04

RUN apt-get update \
	&& apt-get install -y --no-install-recommends ca-certificates curl jq openssl xxd \
	&& rm -rf /var/lib/apt-get/lists/* \
	&& apt-get autoremove -y

COPY jwks-to-pubkey pubkey-to-jwks /usr/local/bin/

WORKDIR /home/ubuntu
USER ubuntu
