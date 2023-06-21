FROM golang:1.20.0 AS builder

WORKDIR /go/src/app

COPY ./Golang/go.mod .
COPY ./Golang/go.sum .
COPY ./Golang/main.go .
COPY ./Golang/.env .

RUN go build -o main

FROM debian:buster-slim

WORKDIR /app

COPY --from=builder /go/src/app/main .
COPY --from=builder /go/src/app/.env .

EXPOSE 8080

CMD ["./main"]