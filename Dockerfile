FROM ubuntu:latest
ARG arch

ADD target/$arch/release/rust_ci /rust_ci
# ADD rust_ci /rust_ci

WORKDIR /

ENV RUST_BACKTRACE=true
CMD ["/rust_ci"]