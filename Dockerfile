FROM ruby:3.1-alpine

LABEL version="2.0.1"
LABEL repository="https://github.com/helaili/jekyll-action"
LABEL homepage="https://github.com/helaili/jekyll-action"
LABEL maintainer="Alain Hélaïli <helaili@github.com>"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl
# Install nodejs as js runtime
RUN apk add --update nodejs

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
