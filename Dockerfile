FROM ruby:2.5.3
RUN apt-get update -qq \
    && apt-get install -y \
      build-essential \
      libpq-dev \
      libxml2 \
      libxslt-dev \
      locales \
      nodejs
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN mkdir /myapp
WORKDIR /myapp
ENV  NOKOGIRI_USE_SYSTEM_LIBRARIES=true
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
EXPOSE 3001
CMD [ "rails", "server" ]