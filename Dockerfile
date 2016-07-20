FROM golang:1.6-alpine

ARG git_commit=unknown
LABEL org.cyverse.git-ref="$git_commit"

COPY . /go/src/github.com/cyverse-de/make-jwt
RUN go install github.com/cyverse-de/make-jwt

ENTRYPOINT ["make-jwt"]
CMD ["--help"]
