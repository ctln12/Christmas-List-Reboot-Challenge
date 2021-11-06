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

# STEP 3 - Mark an item as bought
# - How do you modify your gift_list to store the status of each item?
# gift_list devient un tableau (array) de hashes
# - How does it affect your code?
# Il faut changer :
#   - [x] la méthode display
#   - [x] comment ajouter un nouveau cadeau

# MARK action - Pseudo-code
# 1. Afficher la liste des cadeaux (gift_list)
# 2. Demander à l'utilisateur quel cadeau marquer comme acheté
# 3. Récupérer l'index du cadeau entré par l'utilisateur et le sauvegarder dans une variable
# 4. Changer la valeur du status du cadeau en true
# 5. Afficher la liste des cadeaux (gift_list)

# MARK action - Pseudo-code
# 1. Afficher la liste des cadeaux (gift_list)
# 2. Demander à l'utilisateur quel cadeau marquer comme acheté
# 3. Récupérer l'index du cadeau entré par l'utilisateur et le sauvegarder dans une variable
# 4. Changer la valeur du status du cadeau en true
# 5. Afficher la liste des cadeaux (gift_list)

require_relative 'christmas_list'

# gift_list = ['laptop', 'keyboard', 'smartphone', 'PS5'] # step 1 et 2
gift_list = [
  { name: "laptop", status: true },
  { name: "keyboard", status: false },
  { name: "smartphone", status: false },
  { name: "PS5", status: false }
] # step 3

puts 'Welcome to your Christmas gift list'
user_choice = '' # or nil
while user_choice != 'quit'
  puts 'Which action [ list | add | delete | mark | quit]?'
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
      # [{name: , status: }, ..., 'mouse']
      # -> [{name: , status: }, ..., {name: 'mouse', status: false}]
      gift_list << { name: new_gift, status: false } # step 3
      # gift_list << new_gift # step 1 et 2
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

  when 'mark'
    display(gift_list)
    puts 'Which gift do you want to un/mark? Give its index.'
    gift_index = gets.chomp.to_i
    # if gift_index > 0 && gift_index <= gift_list.size
    if (1..gift_list.size).to_a.include?(gift_index)
      gift_to_mark = gift_list[gift_index - 1]
      if gift_list.include?(gift_to_mark)
        gift_to_mark[:status] = !gift_to_mark[:status] # toggle
        # if gift_to_mark[:status]
        #   gift_to_mark[:status] = false
        # else
        #   gift_to_mark[:status] = true
        # end
        # or gift_list[gift_index - 1][:status] = true
      else
        puts "#{gift_to_mark} doesn't exist"
      end
    else
      puts "Wrong choice. Try again."
    end
    display(gift_list)

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
