FROM alpine:3.8
WORKDIR /opt/sent
# get build deps
RUN apk add --no-cache \
    make \
    libx11-dev \
    libxft-dev \
    g++ \
    git
COPY ./src .
# build sent from source with patches
RUN git apply sent-options-20190213-72d33d4.diff && \
    git apply sent-progress-bar-1.0.diff && \
    make install 

FROM alpine:3.8
ENV DISPLAY=host.docker.internal:0
WORKDIR /
RUN apk add --no-cache \
    farbfeld \
    libxft 
# copy over fonts
COPY ./fonts /usr/share/fonts
# copy built binary
COPY --from=0 /opt/sent/sent /usr/bin/sent
# copy examples
COPY ./example .
ENTRYPOINT [ "sent" ]
CMD [ "example" ]