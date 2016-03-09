#!/bin/bash

bundle install

# more rails foo
bundle exec rake assets:precompile RAILS_ENV=production

# define some env vars
export API_URL=http://api.mindcast.io

# start the app server
bundle exec rails s -b $PRIVATE_IP4 -e production
