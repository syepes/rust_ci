FROM ubuntu:latest

RUN apt-get update && \
  apt-get -y upgrade&& \
  apt-get install -y curl && \
  rm -rf /var/lib/apt/lists/*

ADD target/*/release/rust_ci /rust_ci

WORKDIR /

CMD ["rust_ci"]