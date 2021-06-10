namespace :db do
  desc 'Checks to see if the database exists'
  task exists: :environment do
    ActiveRecord::Base.connection
    exit 0
  rescue ActiveRecord::NoDatabaseError
    exit 1
  end
end
