character_list = [
  [ "Gander", "Thief", "Male"],
  [ "Horo", "Warrior", "Male"]
  ]
  
  character_list.each do |name, subclass, gender|
    Character.create(name: name, subclass: subclass, gender: gender )
  end