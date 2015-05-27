require './phone_number.rb'

class Contact
  attr_accessor :name,:gender,:address,:phone

  def initialize(name, gender, address, phone)
    @name = name.upcase
    @address = address
    @phone = phone
    @gender = gender.upcase
  end

  def to_s
    puts "Name: " + @name.to_s
    puts "Address: " + @address.to_s
    puts ""
    puts "Phone Details:" 
    puts "--------------"
    @phone.each do |phone|
      puts "Type: " + phone.type
      puts "Number: " + phone.number
    end
    puts "---------------------------------------"
    puts ""
  end
end