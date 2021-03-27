FROM --platform=$BUILDPLATFORM rust:latest as builder
WORKDIR /app

RUN cargo install cargo-build-deps

COPY ./Cargo.toml .
COPY ./Cargo.lock .
COPY ./src src

RUN cargo build-deps --release
RUN cargo build --release --verbose

FROM debian:buster-slim

COPY --from=builder /app/target/release/rust_ci /rust_ci

ENV RUST_BACKTRACE=true
ENTRYPOINT ["/rust_ci"]
