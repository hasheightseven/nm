nm
====

An Axum-based Rust web server.

Features
- GET / -> welcome message
- GET /health -> simple health check
- POST /echo -> echoes JSON { "message": "..." }

Requirements
- Rust (stable)

Build

    git clone https://github.com/hasheightseven/nm
    cd nm
    cargo build --release

Run (development)

    cargo run

Run (production - release)

    cargo run --release

Endpoints

- GET / -> returns a short welcome string
- GET /health -> returns JSON { "status": "ok" }
- POST /echo -> accepts JSON { "message": "..." } and returns { "echo": "echo: ..." }

License: MIT
