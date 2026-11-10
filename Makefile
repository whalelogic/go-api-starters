MODULES := \
	connect-rpc \
	graphql-gqlgen \
	grpc-basic \
	grpc-gateway \
	http2-h2c \
	realtime-sse-ws \
	rest-chi \
	rest-openapi \
	rest-stdlib

.PHONY: test-all lint-all proto

test-all:
	@for m in $(MODULES); do \
		echo "==> $$m"; \
		if find "$$m" -name '*.go' -print -quit | grep -q .; then \
			(cd $$m && go test ./...); \
		else \
			echo "no Go packages yet; skipping"; \
		fi; \
	done

lint-all:
	@for m in $(MODULES); do \
		echo "==> $$m"; \
		if find "$$m" -name '*.go' -print -quit | grep -q .; then \
			(cd $$m && go vet ./...); \
		else \
			echo "no Go packages yet; skipping"; \
		fi; \
	done

proto:
	buf generate
