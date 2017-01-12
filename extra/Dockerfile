FROM linagora/kaldi
MAINTAINER Tom Jorquera <tjorquera@linagora.com>

# add repo for trusty. This is needed to install sacc, which depend on libxp6.
# The libxp6 package is no longer present in ubuntu 16.04
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main" >> /etc/apt/sources.list &&\
    apt update

# install required dependencies
RUN apt install -y wget libboost-all-dev cmake build-essential zlib1g-dev\
                   libbz2-dev liblzma-dev libeigen3-dev autoconf-archive git\
                   gfortran python-dev python-pip libffi-dev swig python-numpy\
                   unzip bc libxpm-dev libxt-dev libxmu-dev libxp6

# install kaldi tools/extras
WORKDIR ${KALDI_BASE}/tools
COPY install_kaldi_extras.sh ./install_kaldi_extras.sh
RUN sh ./install_kaldi_extras.sh

# install faster_rnnlm with patch
WORKDIR ${KALDI_BASE}/tools
RUN git clone --depth=1 https://github.com/yandex/faster-rnnlm.git
COPY faster-rnnlm.patch ./faster-rnnlm/faster-rnnlm/faster-rnnlm.patch
RUN cd faster-rnnlm/faster-rnnlm && patch -i faster-rnnlm.patch &&\
    make && cd .. && ln -sf faster-rnnlm/rnnlm

# install additional LM tools

ENV TOOLS_PATH ${KALDI_BASE}/tools

## kenlm
WORKDIR ${TOOLS_PATH}
RUN wget -O - http://kheafield.com/code/kenlm.tar.gz | tar xz
RUN mkdir -p kenlm/build && cd kenlm/build && cmake .. && make -j 4
ENV KENLM_BASE ${TOOLS_PATH}/}kenlm
ENV KENLM_BIN ${KENLM_BASE}/build/bin

## mitlm
WORKDIR ${TOOLS_PATH}
RUN git clone --depth=1 https://github.com/mitlm/mitlm.git
RUN cd mitlm && ./autogen.sh && ./configure --prefix=$PWD/build && make -j 4 &&\
    make install
ENV MITLM_BASE ${TOOLS_PATH}/mitlm
ENV MITLM_BIN ${MITLM_BASE}/build/bin

# install various tools
RUN apt install -y sox flac graphviz && pip install num2words

# set workdir back to home dir
WORKDIR /root

ENTRYPOINT ["/bin/sh"]