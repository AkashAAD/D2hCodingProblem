class Options
  attr_accessor :total_balance, :subscribed_plans, :subscribed_channels, :subscribed_services
  def available_options(*args)
    case args[0]
    when 1
      option_one(args[1])
    when 2
      option_two(args[1])
    when 3
      option_three
    when 4
      option_four(args)
    when 5
      option_five(args)
    when 6
      option_six(args)
    when 7
      option_seven
    when 8
      option_eight
    else
      puts "Opps wrong input has been entered."
    end
  end

  private
  def option_one(balance)
    puts "Current balance is #{balance} Rs."
  end

  def option_two(balance)
    puts "Enter the amount to recharge:"
    recharge = gets.chomp.to_f
    @total_balance = recharge + balance
    @original_balance = @total_balance
    puts "Recharge completed successfully. Current balance is #{@total_balance}"
  end

  def option_three
    puts "Silver pack: Zee, Sony, Star Plus: 50 Rs."
    puts "Gold Pack: Zee, Sony, Star Plus, Discovery, NatGeo: 100 Rs."
    puts "Available channels for subscription:"
    ["Zee: 10 Rs.", "Sony: 15 Rs.", "Star Plus: 20 Rs.", "Discovery: 10 Rs.", "NatGeo: 20 Rs."].each do |pack|
      puts pack
    end
    puts "Available services for subscription:"
    ["LearnEnglish Service: 200 Rs.", "LearnCooking Service: 100 Rs."].each do |service|
      puts service
    end
  end

  def option_four(args)
    puts "Enter the Pack you wish to subscribe: (Silver: 'S', Gold: 'G'):"
    pack = gets.chomp.to_s
    puts "Enter the months:"
    months = gets.chomp.to_i
    avai_pack = args[2][pack.downcase.to_sym]
    puts "You have successfully subscribed the following packs - #{avai_pack[:name]}"
    puts "Monthly price: #{avai_pack[:price]} Rs."
    puts "No of months: #{months}"
    puts "Subscription Amount: #{avai_pack[:price] * months} Rs."
    puts "Discount applied: #{args[4]} Rs."
    puts "Final Price after discount: #{(avai_pack[:price] * months) - args[4]} Rs."
    @total_balance = @total_balance - ((avai_pack[:price] * months) - args[4])
    zero_blance
    puts "Account balance: #{@total_balance} Rs."
    @subscribed_plans += avai_pack[:name] + "+"
    notifications
  end

  def option_five(args)
    puts "Enter channel names to add (separated by commas): (Zee: 'zee', Sony: 'sony', Star Plus: 'star_plus', Discovery: 'discovery', NatGeo: 'nat_geo')"
    channels = gets.chomp.to_s
    channels = channels.split(",")
    channels.each do |channel|
      @total_balance = @total_balance - args[5][channel.to_sym][:price]
      zero_blance      
      @subscribed_channels += args[5][channel.to_sym][:name] + "+"      
    end
    puts "Channels added successfully."
    puts "Account balance: #{@total_balance} Rs."
  end

  def option_six(args)
    puts "Enter the service name: (LearnEnglish: 'les', LearnCooking: 'lcs')"
    service = gets.chomp.to_s
    @total_balance = @total_balance - args[3][service.to_sym][:price]
    zero_blance    
    puts "Service subscribed successfully"    
    puts "Account balance: #{@total_balance} Rs."
    notifications
    @subscribed_services += args[3][service.to_sym][:name] + "+"
  end

  def option_seven
    puts "Currently subscribed packs and channels: #{@subscribed_channels}#{@subscribed_plans}" unless @subscribed_channels == '' || @subscribed_plans == ''
    puts "Currently subscribed services: #{@subscribed_services}" unless @subscribed_services == ''
  end

  def option_eight
    puts "Update email and phone number for notifications."
    while 1
      email_regex = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
      puts "Enter the email:"
      email = gets.chomp.to_s
      if email_regex.match(email)
        break
      else
        puts "Entered email is invalid"
      end
    end

    while 1
      phone_regex = /D?(\d{3})\D?\D?(\d{3})\D?(\d{4})/
      puts "Enter the phone:"
      phone = gets.chomp.to_s
      if phone_regex.match(phone)
        break
      else
        puts "Entered phone is invalid"
      end
    end
    puts "Email and Phone updated successfully"
  end

  def notifications
    ["Email notification sent successfully", "SMS notification sent successfully"].each do |notification|
      puts notification
    end    
  end

  def zero_blance
    if @total_balance <= 0
      puts "Sorry!!! Insufficient balance, Please recharge your account."
      @total_balance = @original_balance
    else
      @original_balance = @total_balance      
    end
  end

end
