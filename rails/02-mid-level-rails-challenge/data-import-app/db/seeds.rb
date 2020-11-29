# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Partner.delete_all
Customer.delete_all
Import.delete_all

partners = Partner.create([
  { name: 'Darth Vader', location: 'Mustafar' },
  { name: 'Mace Windu', location: 'Geonosis' },
  { name: 'Jango Fett', location: 'Slave I' },
  { name: 'Obi-Wan', location: 'Kamino' }
])

customers = Customer.create([
  { partner: partners[0], name: 'Nigel', subdomain: 'foo.primary.com', location: 'San Diego, CA' },
  { partner: partners[1], name: 'Marlin', subdomain: 'bar.primary.com', location: 'Sydney, AU' },
  { partner: partners[1], name: 'Squirt', subdomain: 'merp.flerp.com', location: 'Miami, FL' },
  { partner: partners[2], name: 'Crush', subdomain: 'black.friday.com', location: 'Boston, MA' },
  { partner: partners[2], name: 'Bloat', subdomain: 'happy.holidays.com', location: 'Seattle, WA' },
  { partner: partners[2], name: 'Dory', subdomain: 'sub.domain.com', location: 'Marine City, MI' },
  { partner: partners[3], name: 'Nemo', subdomain: 'sub.marine.com', location: 'Cairns, AU' },
  { partner: partners[3], name: 'Bruce', subdomain: 'sub.way.com', location: 'Santa Fe, NM' }
])

start_times = [Time.now - 1.day, Time.new(2020, 10, 1) - 3.hours, Time.new(2020, 5, 1)]
end_times = [Time.now, Time.new(2020, 10, 1), Time.now - 2.hours]

status = %w(queued running succeeded failed cancelled)

imports = 30.times.each_with_object([]) do |_, attrs|
  start_time = start_times[rand(0..(start_times.length - 1))]
  end_time = end_times[rand(0..(end_times.length - 1))]
  while end_time < start_time
    end_time  = end_times[rand(0..(end_times.length - 1))]
  end
  duration = (end_time - start_time).ceil

  attrs << { customer: customers[rand(0..(customers.length - 1))],
             start_time: start_time,
             end_time: end_time,
             duration: duration,
             status: status.sample,
             identifier: SecureRandom.hex[0...8].upcase
           }
end

Import.create(imports)
