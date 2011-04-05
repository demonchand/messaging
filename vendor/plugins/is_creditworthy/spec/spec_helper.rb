
def rails_version
  puts %x[git branch]
  @current_branch ||= begin
    current_branch= %x[git branch | grep ^* | sed "s/\* //"].chop
    current_branch.include?( "PVR_") ? current_branch.split("_")[2] : (ENV["version"] || "master")
  end
end
puts "recognized #{rails_version}"


rails_app = "rails_app_#{rails_version}"
puts "running in #{rails_app}"

ENV["RAILS_ENV"] = "test"
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + "/#{rails_app}"



rails_config = File.join(ENV['RAILS_ROOT'], "config", "environment")
puts "requiring #{rails_config}"
require File.expand_path( rails_config )



require 'spec'
require 'spec/rails'

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")

  db_adapter = ENV['DB']

  # no db passed, try one of these fine config-free DBs before bombing.
  db_adapter ||=
    begin
      require 'rubygems'
      require 'sqlite3'
      'sqlite3'
    rescue MissingSourceFile
      begin
        require 'sqlite'
        'sqlite'
      rescue MissingSourceFile
      end
    end

  if db_adapter.nil?
    raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3."
  end

  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../rails/init.rb'
end

load_schema

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
#  config.use_instantiated_fixtures  = false
  config.use_instantiated_fixtures  = true
  config.fixture_path = File.join( File.dirname(__FILE__), 'fixtures')
end
