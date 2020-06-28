web: bundle exec puma -p $PORT
worker: QUEUE=* bundle exec rake environment resque:work