def display(list) # début défintion méthode
  puts 'Your gift list contains:'
  list.each_with_index do |gift, i|
    puts "#{i + 1} - #{gift}"
  end
end # fin définition méthode
