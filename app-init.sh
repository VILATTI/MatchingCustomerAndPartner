#!/bin/bash
bundle exec rake db:exists;
result=$?
if [ $result -eq 0 ];
then
  echo "DB exists"
  bundle exec rake db:migrate
else
  echo "DB does not exists"
  bundle exec rake db:create
  bundle exec rake db:schema:load
  bundle exec rake db:seed
fi;

bundle exec rails s -p 3000 -b '0.0.0.0'
