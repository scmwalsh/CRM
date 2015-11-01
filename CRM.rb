require_relative 'contact.rb'

class CRM
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "1. Add a contact"
		puts "2. Modify a contact"
		puts "3. Display all contacts"
		puts "4. Display a contact"
		puts "5. Display contact attribute"
		puts "6. Delete a contact"
		puts "7. Exit"
	end

	def main_menu
		while true
			print_main_menu
			print "Choose and option: "
			user_input = gets.chomp.to_i
			break if user_input == 7
			choose_option(user_input)
		end
	end

	def choose_option(input)
		# input = user_input

		# if input == 1
		# 	add_contact
		# elsif input == 2
		# 	modify_contact
		# elsif input == 3
		# 	display_all_contacts
		# elsif input == 4
		# 	display_contact
		# elsif input == 5
		# 	display_contact_attributes
		# elsif input == 6
		# 	delete_contact
		# elsif input == 7
		# 	exit
		# else
		# 	puts "I'm sorry Dave, I'm afraid you can't do that"
		# end

		case input
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_contact_attributes
		when 6 then delete_contact
		when 7 then exit
		else
			puts "I'm sorry Dave, I'm afraid you can't do that"
		end
	end

	def add_contact
		print "First name: "
		first_name = gets.chomp

		print "Last name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Notes: "
		notes = gets.chomp

		Contact.create(first_name, last_name, email: email, notes: notes)
	end

	def modify_contact
		print "Enter the ID of the contact you would like to change."
		id_to_modify = gets.chomp
		contact = Contact.find(id_to_modify)

		if contact
			puts "the contact is #{contact.inspect}"
		end

		puts "Are you sure (y/n)"
		answer = gets.chomp

		if answer == "y"
			puts "What would you like to change? 1. First name 2. Last name 3. Email 4. Notes"
			field = gets.chomp
			puts "What is the new value?"
			new_value = gets.chomp
			case field 
			when 1
				contact.first_name = new_value
			when 2
				contact.last_name = new_value
			when 3
				contact.email = new_value
			when 4
				contact.notes = new_value
			else 
				puts "No changes were made"
			end
		end
	end

	def display_contact
		puts "Enter the contact ID you're looking for."
		id = gets.chomp.to_i
		contact = Contact.find(id)
		print_contact(contact)
	end

	def display_all_contacts
		Contact.all.each do |contact|
			puts "#{contact.full_name}, #{contact.email}, #{contact.notes}, #{contact.id}"
		end

		puts "Press enter to continue"
		continue = gets.chomp
	end

	def print_contact(contact)
		puts "First name: #{contact.first_name}"
		puts "Last name: #{contact.last_name}"
		puts "Email: #{contact.email}"
		puts "Notes: #{contact.notes}"
	end

	def delete_contact
		puts "enter the contact id you want to delete"
		id = gets.chomp.to_i
		contacts = Contact.all
		contacts.delete_if do |contact|
			contact.id == id 
		end
	end
end

my_awesome_crm = CRM.new('Bitmaker CRM')
my_awesome_crm.main_menu