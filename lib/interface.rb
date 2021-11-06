# TODO: you can build your christmas list program here!

# STEP 1 - The menu loop
# Pseudo-code
# 1. Afficher un message d'accueil
# 2. Tant que l'action n'est pas 'quit'...
# 3. ... Demander à l'utilisateur ce qu'il veut faire et lui proposer les actions possibles
# 4. .. Récupérer le choix de l'utilisateur et le sauvegarder dans une variable
# 5. .. Afficher un message, par exemple: 'TODO: list items'
# 6. Quand l'utilisateur choisit 'quit', afficher 'Goodbye'

# STEP 2 - List, Add, Delete
# How do you model your gift_list?
# gift_list est un tableau (array) de strings

# LIST action - Pseudo-code
# ruby lib/interface.rb
# > Welcome to your Christmas gift list
# > Which action [list|add|delete|quit]?
# > list
# > Your gift list contains:
# > 1 - laptop
# > 2 - keyboard
# > 3 - smartphone
# > 4 - PS5
# > Which action [list|add|delete|quit]?
# etc.
# Pseudo-code
# 1. Afficher un message d'introduction
# 2. Afficher chaque cadeau de gift_list comme une liste ordonnée

# ADD action - Pseudo-code
# 1. Demander à l'utilisateur d'entrer un cadeau à rajouter à sa liste (gift_list)
# 2. Récupérer le cadeau entré par l'utilisateur et le sauvegarder dans une variable
# 3. Ajouter le cadeau à la liste (gift_list) s'il n'existe pas déjà
# 4. Afficher la gift_list modifiée

# DELETE action - Pseudo-code
# 1. Afficher la liste des cadeaux (gift_list)
# 2. Demander à l'utilisateur quel cadeau supprimer
# 3. Récupérer le cadeau entré par l'utilisateur et le sauvegarder dans une variable
# 4. Supprimer le cadeau de la liste (gift_list)

require_relative 'christmas_list'

gift_list = ['laptop', 'keyboard', 'smartphone', 'PS5']

puts 'Welcome to your Christmas gift list'
user_choice = '' # or nil
while user_choice != 'quit'
  puts 'Which action [ list | add | delete | quit]?'
  user_choice = gets.chomp
  case user_choice.downcase
  when 'list'
    display(gift_list) # exécution de la méthode display

  when 'add'
    puts 'Which gift do you want to add to your list?'
    new_gift = gets.chomp
    if gift_list.include?(new_gift)
      puts 'already in list'
    else
      gift_list << new_gift
    end
    display(gift_list)

  when 'delete'
    display(gift_list)
    puts 'Which gift do you want to delete? Give its index.'
    gift_index = gets.chomp.to_i
    gift_to_remove = gift_list[gift_index - 1]
    if gift_list.include?(gift_to_remove)
      gift_list.delete(gift_to_remove)
      # or gift_index.delete_at(gift_index - 1)
    else
      puts "#{gift_to_remove} doesn't exist"
    end

  when 'quit'
    puts 'Goodbye'

  else
    puts 'Wrong action. Try again.'
  end
end

# est remplacé par un case/when
# if user_choice == 'list'
#   puts 'TODO: list items'
# elsif user_choice == 'add'
#   puts 'TODO: ask user an item and add it to gift list'
# elsif user_choice == 'delete'
#   puts 'TODO: ask user the index of item to delete and delete it'
# elsif user_choice == 'quit'
#   puts 'Goodbye'
# else
#   puts 'Wrong action. Try again.'
# end
