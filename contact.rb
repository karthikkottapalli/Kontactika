
require './phone_number.rb'

class Contact
  attr_accessor :name,:gender,:address,:phone

  def initialize(name, gender, address, phone)
    @name = name
    @address = address
    @phone = phone
    @gender = gender
  end

  def match(str)
    long_str = @name + " " + @address + " " + @gender    
    phone_str = " "
    @phone.each do |phone|
      phone_str = phone.type + " " +phone.number
      long_str = long_str + phone_str
    end
    (long_str + phone_str).include?(str)   
  end

  def to_s
    puts ""
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
