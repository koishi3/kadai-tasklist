# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    def time_rand from = 0.0, to = Time.now
        Time.at(from+rand*(to.to_f-from.to_f))
    end
    
    def status_rand 
        status_array=["未","進行中","済"]
        status_array.sample
    end
    
(1..50).each do |number|        
    Task.create(title: 'test-title ' + number.to_s, content: 'test-content ' + number.to_s, deadline: time_rand, status: status_rand)
end