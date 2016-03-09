FROM ruby:2.3-slim
MAINTAINER Michael Kuehl <hello@ratchet.cc>

#
# BASIC RAILS DOCKERFILE
#

RUN apt-get update && apt-get -y install build-essential git postgresql-client libpq-dev
RUN gem install bundler

# add the Gemfile and bundle gems already
ADD Gemfile /Gemfile
ADD Gemfile.lock /Gemfile.lock
RUN bundle install

#
# END BASIC RAILS DOCKERFILE
#

# variables that controll the creation of the app
ENV REPO git_repo
ENV BRANCH master

# app vars
ENV BASE_URL www.mindcast.io
ENV DOMAIN_NAME mindcast.io
ENV DEFAULT_APPKEY xyz
ENV API_URL http://api.mindcast.io

# generic vars
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE 36572ec8b9de123bbbdfaf79935ddedd1bee63ee2f9b488b56575f4a023cf97b84e3c37ea41617e19dbd83db812fec7cee44fc49cec62ea1bb5c102a6516b85d

# db vars
ENV DB_HOST localhost
ENV DB_PORT 3306
ENV DB_USER admin
ENV DB_PASSWORD mariadb

# email vars
ENV SMTP_PROVIDER_HOST mx.mindcast.io
ENV SMTP_PROVIDER_DOMAIN mindcast.io
ENV SMTP_PROVIDER_USERNAME user
ENV SMTP_PROVIDER_PASSWORD password

# default admin user
ENV ADMIN_NAME admin
ENV ADMIN_EMAIL admin@mindcast.io
ENV ADMIN_PASSWORD changeme

#
# default RAILS port
EXPOSE 3000

# run the script to deploy / update the app
ADD bin/run.sh /run.sh
CMD ["/run.sh"]
