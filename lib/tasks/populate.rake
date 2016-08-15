namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    Rake::Task['db:reset'].invoke

    1000.times do |x|
      @department = ["Marketing", "Sales", "Technical"].sample
      @complete = [true, false].sample
      @fn = Faker::Name.first_name
      @ln = Faker::Name.last_name
      @name = "#{@fn} #{@ln}"
      loop do
        @name.index(/[^A-Za-z]\s/) ? @name = Faker::Name.name : break
      end
      @email = "#{@fn}#{@ln}@#{Faker::Internet.domain_name}"

      @support = Support.create!(
        :name => @name,
        :email => @email,
        :department => @department,
        :message => Faker::Hipster.paragraphs.join("\n"),
        :complete => @complete
      )
    end

  end
end
