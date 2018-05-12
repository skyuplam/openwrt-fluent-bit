From buildpack-deps:stretch-curl

MAINTAINER Terrence Lam <skyuplam@gmail.com>

ENV OPENWRT_VERSION=17.01.4
ENV OPENWRT_BASE_URL=https://downloads.lede-project.org/releases
ENV OPENWRT_TARGET=ramips
ENV OPENWRT_SUBTARGET=rt3883
ENV OPENWRT_URL=${OPENWRT_BASE_URL}/${OPENWRT_VERSION}/targets/${OPENWRT_TARGET}/${OPENWRT_SUBTARGET}
ENV OPENWRT_GCC_VERSION=5.4.0
ENV OPENWRT_MUSL_VERSION=1.1.16
ENV OPENWRT_SDK=lede-sdk-${OPENWRT_VERSION}-${OPENWRT_TARGET}-${OPENWRT_SUBTARGET}_gcc-${OPENWRT_GCC_VERSION}_musl-${OPENWRT_MUSL_VERSION}.Linux-x86_64
ENV OPENWRT_SDK_URL=${OPENWRT_URL}/${OPENWRT_SDK}.tar.xz
ENV OPENWRT_ARCH=mipsel_74kc
ENV OPENWRT_TOOLCHAIN=toolchain-${OPENWRT_ARCH}_gcc-${OPENWRT_GCC_VERSION}_musl-${OPENWRT_MUSL_VERSION}

ENV STAGING_DIR=/home/openwrt/sdk/staging_dir
ENV OPENWRT_TOOLCHAIN_DIR=${STAGING_DIR}/${OPENWRT_TOOLCHAIN}
ENV PATH=${PATH}:${STAGING_DIR}/host/bin:${OPENWRT_TOOLCHAIN_DIR}/bin

RUN set -xe \
  && apt-get update \
  && apt-get install -y build-essential \
                        cmake \
                        ccache \
                        curl \
                        file \
                        gawk \
                        gettext \
                        git \
                        libncurses5-dev \
                        libssl-dev \
                        mercurial \
                        python \
                        subversion \
                        sudo \
                        tree \
                        unzip \
                        wget \
                        vim-tiny \
                        xsltproc \
                        zlib1g-dev \
  && useradd -m openwrt \
  && echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

RUN set -xe \
  && curl -sSL ${OPENWRT_SDK_URL} | tar -xJ \
  && ln -s ${OPENWRT_SDK} sdk

ENV FLUENTBIT_VERSION=0.13.1
ENV FLUENTBIT_URL=https://github.com/fluent/fluent-bit/archive/v${FLUENTBIT_VERSION}.tar.gz

RUN set -xe \
  && curl -sSL ${FLUENTBIT_URL} | tar -xz \
  && ln -s fluent-bit-${FLUENTBIT_VERSION} fluent-bit


COPY ./openwrt.cmake /home/openwrt/

CMD ["bash"]
