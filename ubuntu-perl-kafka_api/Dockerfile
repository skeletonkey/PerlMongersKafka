FROM ubuntu:artful
LABEL maintainer="tank@jundy.com"

RUN apt-get update; apt-get -y install make gcc apt-utils dialog zlib1g-dev
RUN apt-get update; apt-get -y install libcapture-tiny-perl libconfig-inifiles-perl libconst-fast-perl libcpanplus-perl \
    libdata-compare-perl libdata-treedumper-perl libdata-validate-domain-perl libdata-validate-ip-perl                  \
    libdevel-checklib-perl libexception-class-perl libextutils-config-perl libextutils-helpers-perl                     \
    libextutils-installpaths-perl libimporter-perl libio-captureoutput-perl libmodule-build-perl                        \
    libmodule-build-tiny-perl libmodule-install-perl libpar-dist-perl libpod-coverage-perl libproc-daemon-perl          \
    libreadonly-perl libscalar-util-numeric-perl libscope-guard-perl libstring-crc32-perl libsub-info-perl              \
    libsys-sigaction-perl libterm-table-perl libtest-block-perl libtest-deep-perl libtest-exception-perl                \
    libtest-fatal-perl libtest-nowarnings-perl libtest-pod-coverage-perl libtest-pod-perl libtest-sharedfork-perl       \
    libtest-warn-perl libtest2-suite-perl libtext-diff-perl libtry-tiny-perl
RUN cpanp install Kafka
