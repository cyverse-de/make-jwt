FROM golang:1.11-alpine

COPY . /go/src/github.com/cyverse-de/make-jwt
ENV CGO_ENABLED=0
RUN wget https://github.com/upx/upx/releases/download/v3.95/upx-3.95-amd64_linux.tar.xz \
 && tar -xJvf upx-3.95-amd64_linux.tar.xz upx-3.95-amd64_linux/upx \
 && go install github.com/cyverse-de/make-jwt \
 && ./upx-3.95-amd64_linux/upx --ultra-brute /go/bin/make-jwt \
 && rm -rf upx-3.95-amd64_linux*

ENTRYPOINT ["make-jwt"]
CMD ["--help"]

ARG git_commit=unknown
ARG version="2.9.0"
ARG descriptive_version=unknown

LABEL org.cyverse.git-ref="$git_commit"
LABEL org.cyverse.version="$version"
LABEL org.cyverse.descriptive-version="$descriptive_version"
LABEL org.label-schema.vcs-ref="$git_commit"
LABEL org.label-schema.vcs-url="https://github.com/cyverse-de/make-jwt"
LABEL org.label-schema.version="$descriptive_version"
