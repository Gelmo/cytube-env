FROM node:10-alpine

RUN apk update && \
    apk upgrade && \
    apk add --update ca-certificates && \
    apk add gnutls-dev zlib-dev yasm-dev lame-dev libogg-dev \
    x264-dev libvpx-dev libvorbis-dev x265-dev freetype-dev \
    libass-dev libwebp-dev rtmpdump-dev libtheora-dev opus-dev \
    python2 ffmpeg git build-base gcc g++ make wget curl && \
    apk add --no-cache --virtual .build-dependencies \
    build-base coreutils tar bzip2 x264 gnutls nasm
RUN apk del --purge .build-dependencies && \
    rm -rf /var/cache/apk/*

CMD ["node"]
