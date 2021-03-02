FROM golang:1.14.3-alpine AS build
WORKDIR /src
COPY . .
RUN go mod init src
RUN go build -o hello /src

FROM scratch
COPY --from=build /src /
ENTRYPOINT ["/hello"]


