require_relative '../models/address_book'

class MenuController
   attr_reader :address_book
   
   def initialize 
       @address_book = AddressBook.new
   end
   
   def main_menu
      puts "Main Menu - #{address_book.entries.count} entries"
      puts "1 - View all entries"
      puts "2 - Create an entry"
      puts "3 - Search for an entry"
      puts "4 - Import entries from a CSV"
      puts "5 - View Entry Number n"
      puts "6 - Exit"
      print "Enter your selection: "
 
      # #3
      selection = gets.to_i
    
    
      case selection
        when 1
            system "clear"
            view_all_entries
            main_menu
        when 2 
            system "clear"
            create_entry
            main_menu
        when 3
            system "clear"                
            search_entries
            main_menu
        when 4
            system "clear"
            read_csv
            main_menu
        when 5 
            system "clear"
            view_entry
            main_menu
        when 6 
             puts "Good-bye!"
             # #8
             exit(0)
        # #9
        else
           system "clear"
           puts "Sorry, that is not a valid input"
           main_menu
        
      end
  end
      def view_all_entries
          # #14
          address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s
            puts "--------------------------------------"
            # #15
            entry_submenu(entry)
          end
 
          system "clear"
          puts "End of entries"
      end
 
     def entry_submenu(entry)
       # #16
       puts "n - next entry"
       puts "d - delete entry"
       puts "e - edit this entry"
       puts "m - return to main menu"
 
       # #17
       selection = gets.chomp
 
       case selection
          # #18
         when "n"
         # #19
         when "d"
         when "e"
         # #20
         when "m"
           system "clear"
           main_menu
         else
           system "clear"
           puts "#{selection} is not a valid input"
           entry_submenu(entry)
        end
     end
   
      def create_entry
          system "clear"
          puts "New AddressBloc Entry"
          
          print "Name: "
          name = gets.chomp
          
          print "Phone: "
          phone = gets.chomp
          
          print "Email: "
          email = gets.chomp
          
          address_book.add_entry(name, phone, email)
          
          system "clear"
          puts "New entry created"
      end
 
      def search_entries
      end
 
      def read_csv
      end
      
      def view_entry
         print "Entry Number: " 
         entry_number = gets.to_i
         while entry_number > address_book.entries.count || entry_number == 0 do
             if address_book.entries.count == 0
                 puts "No entries in the address book. First add entries"
                 main_menu
             end
             puts "Entry Number: #{entry_number} is invalid, please re-enter valid number"
             print "Entry Number: "
             entry_number = gets.to_i
         end
         puts address_book.entries[entry_number].to_s
      end
   
end