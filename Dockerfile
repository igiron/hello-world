FROM golang:1.24-bookworm AS builder

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN go build -o hello-world .

FROM ubuntu:24.04

WORKDIR /app
COPY --from=builder /app/hello-world .

CMD ["./hello-world"]
