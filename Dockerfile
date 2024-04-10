FROM alpine:latest AS stage1

WORKDIR /app
COPY    /app .

RUN apk add --no-cache go
RUN go build app.go

FROM scratch AS stage2
WORKDIR /app
COPY --from=stage1 /app .
CMD ["./app"]