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
      contact.to_s
    end
  end

  def search(query)
    search_results = []
    @contacts.each do |contact|
      if contact.match(query)
        search_results.push(contact)
      end
    end
    return search_results.uniq
  end

  def run 
    @address_book = AddressBook.new
      puts ""
      puts "========== WELCOME TO THE ADDRESS BOOK ======"
      puts ""
      puts "-------------------MENU--------------------"
    loop do 
      puts ""
      puts "       WHaT Do yOu WaNt To DO nOw?"
      puts ""
      puts "s: Do you want to search a contact? type(sS):"
      puts "a: Do you want to add a contact? type(aA):"
      puts "e: Do you want to exit? type(eE):"
      puts ""
      puts "-------------------MENU--------------------"
      input = gets.chomp.downcase
      case input.downcase
      when 'e'
        break
      when 'a'
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
          @phone_data = PhoneNumber.new(type,number)
          phone.push(@phone_data)
          puts "Add More Phone Data?(yYnN)"
          input = gets.chomp.downcase
          case input
          when 'n'
            break
          end
        end
        @contact = Contact.new(name, gender, address, phone)
        @address_book.add_contact(@contact)
        input = gets.chomp.downcase
        puts "Do you want to continue? (yYnN)"
        input = gets.chomp.downcase
        case input
        when 'n'
          break
        end
      when 's'
        puts "Enter a search query"
        input = gets.chomp.downcase
        @search_results = @address_book.search(input)
        @search_results.each do |search_result|
          search_result.to_s
        end
      end
    end
    puts "Data Entry Done! Printing All Contacts"
    @address_book.to_s
    puts "--------------------------------------"
  end
end

@address_book = AddressBook.new

@address_book.run