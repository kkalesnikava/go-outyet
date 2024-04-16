# syntax=docker/dockerfile:1

FROM golang:1.19 AS builder

WORKDIR /go/src/app

# Download Go modules.
COPY go.mod ./
RUN go mod download

# Copy the source code.
COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /go/bin/app


# Run the tests in the container
FROM builder AS tester

RUN go test -v ./...


# Deploy the application binary into a distroless image
FROM gcr.io/distroless/base-debian12

WORKDIR /

COPY --from=builder /go/bin/app /

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app"]
