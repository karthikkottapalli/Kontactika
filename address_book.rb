require './contact.rb'

class AddressBook
  attr_accessor :contacts

  def initialize
    @contacts = []
  end

  def add_contact(contact)
    @contacts.push(contact)
  end

  def to_s
    puts "Printing Contents of the Address Book: "
    puts "---------------------------------------"
    number = 0
    @contacts.each do |contact| 
      number = number + 1
      puts "CONTACT #{number}"
      puts ""
      contact.to_s
    end
  end

  def run 
    @address_book = AddressBook.new
    loop do 
      puts "Welcome To The Address Book"
      puts "---------------------------"
      puts "Please Enter a contact name: "
      name = gets.chomp.downcase
      puts "Enter the gender: "
      gender = gets.chomp.downcase
      puts "Enter the address: "
      address = gets.chomp.downcase
      phone = []
      loop do
        puts "Enter the phone type(work/home/spare): "
        type = gets.chomp.downcase
        puts "Enter the phone number: "
        number = gets.chomp.downcase
        puts "Add More Phone Data?(yYnN)"
        input = gets.chomp.downcase
        @phone_data = PhoneNumber.new(type,number)
        phone.push(@phone_data)
        case input.downcase
        when 'n'
          break
        end
      end
      @contact = Contact.new(name, gender, address, phone)
      @address_book.add_contact(@contact)
      input = gets.chomp.downcase
      puts "Do you want to continue adding more contacts? (yYnN)"
      input = gets.chomp.downcase
      case input.downcase
      when 'n'
        break
      end
    end
    puts "Data Entry Done! Printing All Contacts"
    @address_book.to_s
    puts "--------------------------------------"
  end
end

@address_book = AddressBook.new

@address_book.run