#rvm use 2.5.1
require './lib/options'
puts "**********D2h Coding Problem***********"
puts

class D2hService < Options
  attr_accessor :current_balance, :packs, :services, :discount, :available_channels
  def initialize
    @current_balance = 100.0
    @packs = { g: {name: "Gold", price: 100.0}, s: { name: "Silver", price: 50.0} }
    @services = { les: {name: "Learn English", price: 200.0}, lcs: {name: "Learn Cooking", price: 100.0} }
    @discount = 30.0
    @available_channels = { zee: { name: "Zee", price: 10.0 },
      sony: { name: "Sony", price: 15.0 },
      star_plus: { name: "Star Plus", price: 20.0 },
      discovery: { name: "Discovery", price: 10 },
      nat_geo: { name: "NatGeo", price: 20 }
    }
  end

  def display_options
    puts "To select an option please enter number as 1,2,3.. etc:"
    puts "1. View the current balance in account."
    puts "2. Enter the recharge amount"
    puts "3. View available packs, channels and services available packs for subscription"
    puts "4. Subscribe to channel packs"
    puts "5. Add channels to existing subscription"
    puts "6. Subscribe to special services"
    puts "7. View current subscription details"
    puts "8. Update email and phone number for notifications"
    puts "Would you like to exit? 'yes' or 'YES' otherwise please enter your option."    
  end
end

obj = D2hService.new
obj.subscribed_plans = ''
obj.subscribed_channels = ''
obj.subscribed_services = ''

while 1
  obj.display_options
  option = gets.chomp
  if option.downcase == 'yes'
    puts "PROGRAMME TERMINATED :("
    break
  else
    puts "================================OUTPUT START========================================="
    puts
    obj.available_options(option.to_i, obj.current_balance, obj.packs, obj.services, obj.discount, obj.available_channels)
    obj.current_balance = obj.total_balance.to_f if option.to_i != 1
    puts    
    puts "================================OUTPUT ENDS========================================="
  end
end
