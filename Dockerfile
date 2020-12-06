ARG GO_VERSION=1.15.6

FROM golang:${GO_VERSION}

ENV TZ=Europe \
    EDITOR=vi \
    LANG=en_US.UTF-8 \
    GO111MODULE=on

RUN    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt update && \
    apt install -y sudo git make curl protobuf-compiler && \
    echo 'alias ll="ls -lsah"' >> ~/.bashrc && \
    go get -v \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc \
    # Base Go tools needed for VS code Go extension
    golang.org/x/tools/gopls \
    github.com/ramya-rao-a/go-outline \
    golang.org/x/tools/cmd/guru \
    golang.org/x/tools/cmd/gorename \
    github.com/go-delve/delve/cmd/dlv \
    # Extra tools integrating with VS code
    github.com/fatih/gomodifytags \
    github.com/haya14busa/goplay/cmd/goplay \
    github.com/cweill/gotests/... \
    github.com/davidrjenni/reftools/cmd/fillstruct \
    # Terminal tools
    github.com/golang/mock/gomock \
    github.com/golang/mock/mockgen \
    github.com/vektra/mockery/v2/... \
    2>&1 && \
    rm -rf $GOPATH/pkg/* $GOPATH/src/* /root/.cache/go-build && \
    export PATH="$PATH:$(go env GOPATH)/bin"
