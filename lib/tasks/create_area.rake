namespace :create_area do
  desc "Create area"
  task :create_default_area => :environment do
    list_tenant_name = [Tenant::ASIA_SCHEMA, Tenant::EUROPE_SCHEMA, Tenant::AMERICA_SCHEMA]
    list_tenant_name.each do |tenant_name|
      unless Area.exists?(name: tenant_name, tenant_name: tenant_name)
        Area.create(name: tenant_name, tenant_name: tenant_name, status: 1)
        puts "Area: #{tenant_name} created"
      end
    end
    puts 'Area created'
  end
end
