# go-api-starters

A side-by-side set of Go API starter implementations that share one contract and compare transport/framework trade-offs.

## Current layout

```text
go-api-starters/
├── README.md
├── go.work
├── Makefile
├── proto/notes/v1/
├── buf.yaml
├── buf.gen.yaml
├── rest-stdlib/
├── rest-chi/
├── rest-openapi/
├── http2-h2c/
├── grpc-basic/
├── grpc-gateway/
├── connect-rpc/
├── realtime-sse-ws/
├── graphql-gqlgen/
└── .github/workflows/
    ├── ci.yml
    └── copilot-setup-steps.yml
```

## Starter comparison

| Starter | Transport | Main library/tooling | Best for |
|---|---|---|---|
| `rest-stdlib` | HTTP/1.1 | `net/http` | Minimal dependencies and maximum control |
| `rest-chi` | HTTP/1.1 | `go-chi/chi` | Lightweight router ergonomics |
| `rest-openapi` | HTTP/1.1 | OpenAPI-first codegen | Contract-driven REST development |
| `http2-h2c` | HTTP/2 (h2c) | `net/http` | Internal cleartext HTTP/2 services |
| `grpc-basic` | gRPC | `google.golang.org/grpc` | Internal RPC with strong typing |
| `grpc-gateway` | gRPC + REST bridge | gRPC + gateway | One backend serving gRPC and JSON clients |
| `connect-rpc` | Connect/gRPC/gRPC-web | `connectrpc/connect-go` | Multi-protocol RPC with simpler DX |
| `realtime-sse-ws` | SSE/WebSocket | stdlib + websocket stack | Push/streaming use-cases |
| `graphql-gqlgen` | GraphQL over HTTP | `99designs/gqlgen` | Client-driven querying and schema evolution |

## Which one should I pick?

- Pick **`rest-stdlib`** for learning fundamentals or dependency-minimal services.
- Pick **`rest-chi`** when you want pragmatic REST routing without heavy framework overhead.
- Pick **`rest-openapi`** if contract-first collaboration and generated clients are top priority.
- Pick **`grpc-basic`** when all clients are internal and you want strict contracts/perf.
- Pick **`grpc-gateway`** when you need both modern RPC and public JSON endpoints.
- Pick **`connect-rpc`** for browser-friendly RPC with gRPC compatibility.
- Pick **`http2-h2c`** for trusted-network HTTP/2 without TLS termination complexity.
- Pick **`realtime-sse-ws`** for real-time push workloads.
- Pick **`graphql-gqlgen`** when frontend teams need flexible query shapes.

## Copilot environment notes

The repository includes `.github/workflows/copilot-setup-steps.yml` to prepare a Go + Neovim environment for Copilot cloud agent.

To apply personal key mappings from your dotfiles repository, configure these repository variables in the `copilot` environment:

- `COPILOT_DOTFILES_REPO` (for example, `https://github.com/<you>/dotfiles.git`)
- `COPILOT_DOTFILES_REF` (optional, defaults to `main`)
