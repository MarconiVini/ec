namespace :system do
  desc "Invokes all methods that resets our system"
  task reset: :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:mongoid:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    puts "#" * 60
    puts "---------------Done! Setted a new environment---------------"
    puts "#" * 60
  end
end
