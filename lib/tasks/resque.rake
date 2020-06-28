require 'resque'
require 'resque/tasks'

task "resque:preload" => :environment