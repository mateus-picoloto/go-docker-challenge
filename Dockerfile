FROM golang:1.19.13-alpine as builder

WORKDIR /app

COPY src/main.go /app

RUN go build main.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]