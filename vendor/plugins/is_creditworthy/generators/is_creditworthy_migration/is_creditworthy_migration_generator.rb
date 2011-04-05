class IsCreditworthyMigrationGenerator < Rails::Generator::Base
 
  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate'
    end
  end
 
  def file_name
    "is_creditworthy_migration"
  end
end
