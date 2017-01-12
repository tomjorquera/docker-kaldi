FROM ubuntu:16.04
MAINTAINER Tom Jorquera <tjorquera@linagora.com>

ENV KALDI_BASE /kaldi

RUN apt update && apt install -y g++ zlib1g-dev make automake libtool-bin git\
                                 autoconf subversion libatlas3-base bzip2\
                                 wget python2.7 &&\
    ln -s /usr/bin/python2.7 /usr/bin/python && ln -s -f bash /bin/sh

RUN git clone https://github.com/kaldi-asr/kaldi.git ${KALDI_BASE} --depth=1

RUN cd ${KALDI_BASE}/tools && make &&\
    cd ${KALDI_BASE}/src && ./configure && make depend && make

ENV KALDI_BIN ${KALDI_BASE}/src/bin

ENTRYPOINT ["/bin/sh"]