def display(list) # début défintion méthode
  puts 'Your gift list contains:'
  list.each_with_index do |gift, i|
    status = gift[:status] ? '[x]' : '[ ]'
    puts "#{i + 1} - #{status} #{gift[:name]}"
    # or using transform status
    # puts "#{i + 1} - #{transform(gift[:status])} #{gift[:name]}"
  end
end # fin définition méthode

def transform(status)
  return status ? '[x]' : '[ ]'
  # or return status == true ? '[x]' : '[ ]'
  # or
  # if status == true
  #   return '[x]'
  # else
  #   return '[ ]'
  # end
end

# puts transform(true)
# puts transform(false)
