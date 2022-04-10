FROM jekyll/jekyll
Label MAINTAINER Amir Pourmand
#install imagemagick tool for convert command
RUN apk add --no-cache --virtual .build-deps \
        libxml2-dev \
        shadow \
        autoconf \
        g++ \
        make \
    && apk add --no-cache imagemagick-dev imagemagick
WORKDIR /srv/jekyll
ADD Gemfile /srv/jekyll/
RUN gem install bundler -v 2.3.10
RUN bundler install
RUN gem install htmlbeautifier
