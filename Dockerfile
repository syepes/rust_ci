FROM ubuntu:latest

ADD target/*/release/rust_ci /rust_ci

WORKDIR /

CMD ["/rust_ci"]