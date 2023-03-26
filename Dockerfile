FROM golang:alpine AS build

WORKDIR /app

COPY /app/ /app/

RUN go build -ldflags '-s -w' hello.go

FROM scratch

WORKDIR /app

COPY --from=build /app/ /app/

# Executa o binário
CMD ["/app/hello"]