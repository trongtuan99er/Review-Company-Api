# Load common seeds
Dir[File.join(Rails.root, 'db', "seeds/common", '*.rb')].sort.each do |seed|
  load seed
end

