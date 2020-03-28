require './lib/d2h_service'
require "pry"

describe D2hService do 
  d2h_service = D2hService.new
  d2h_service.current_balance = 400
  output = StringIO.new
  context "check all required instance variable are available and options methods should be present" do
    it "instance variables should be present" do
      expect(d2h_service.instance_variables.count).to eq 5
    end

    it "options method should be available" do
      expect(d2h_service.display_options).to eq(nil)
    end
  end

  context "test all available options with valid data" do
    it "view current balance" do
      resp = d2h_service.available_options(1, d2h_service.current_balance, d2h_service.packs, d2h_service.services, d2h_service.discount, d2h_service.available_channels)
      expect(resp == nil && d2h_service.current_balance == 400.00).to eq(true)
    end

    it "recharge with new amount and total balance" do
      d2h_service.available_options(2, d2h_service.current_balance, d2h_service.packs, d2h_service.services, d2h_service.discount, d2h_service.available_channels)
      expect(d2h_service.total_balance).to eq(400.00)
    end

    it "purchase subscription" do
      d2h_service.available_options(2, d2h_service.current_balance, d2h_service.packs, d2h_service.services, d2h_service.discount, d2h_service.available_channels)
    end
  end
  
  # ...

end