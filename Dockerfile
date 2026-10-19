# syntax=docker/dockerfile:1

FROM rust:1.72 as builder
WORKDIR /usr/src/nm

# Cache dependencies
COPY Cargo.toml Cargo.lock ./
RUN mkdir -p src && echo "fn main(){}" > src/main.rs
RUN cargo build --release || true

# Copy the source and build for release
COPY . .
RUN cargo build --release -p nm

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/src/nm/target/release/nm /usr/local/bin/nm
EXPOSE 3000
ENV RUST_LOG=info
CMD ["nm"]
