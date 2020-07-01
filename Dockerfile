FROM registry.redhat.io/ocp-tools-43-tech-preview/source-to-image-rhel8

USER root

ENV GOPATH=/go

RUN  mkdir /go && chmod 755 /go && yum install -y git golang-bin && go get github.com/yudai/gotty 
WORKDIR /workspace

USER 1001

ENV HOME=/workspace

ENTRYPOINT ["/go/bin/gotty"]
CMD ["-w","bash"]
