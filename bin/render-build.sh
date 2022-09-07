#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake app:assets:precompile
bundle exec rake app:assets:clean
bundle exec rake db:migrate