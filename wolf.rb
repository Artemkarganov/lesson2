class Wolf
  def initialize(name, kind)
    @name = name, @health = 10, @hunger = 10, @mood = 5
    @sleepness = 0
    @kind = kind
    @sickness = 0
    @time = 10
    @age = 0
    @size = 1
    @weight = 1

    puts @kind.to_s + ' was born. His name is ' + @name.to_s
    puts 'Type pet.help to get the list of avaiable commands.'
  end

  def help
    puts "Use pet.hurt to hurt your pet
          Use pet.feed to feed your pet
          Use pet.heal to heal your pet
          Use pet.walk to walk your pet
          Use pet.play to play with your pet
          Use pet.status to get an info about your pet
          Use pet.sleep to put your pet to bed"
  end

  def hurt
    puts "You've hurted your pet. Why?"
    @health -= 1
    @mood -= 2
    @sleepness += 1
    time_pass(1)
  end

  def feed
    puts @name.to_s + ' loves to eat. Omnomnom'
    @hunger += 2
    @size += 1
    overfed if @hunger >= 10
    time_pass(1)
  end

  def overfed
    puts @name.to_s + 'ate to much. What were you thinking about?'
    @health -= 1
    @sickness += 1
    @weight += 1
  end

  def heal
    puts 'You put your hands on ' + @name.to_s + 'head. He feels better now'
    @sickness = 0
    @health += 2 if @health < 9
    time_pass(1)
  end

  def walk
    puts 'You take " + @name.to_s + ' + 'for a walk. He likes it'
    @mood += 1
    time_pass(2)
  end

  def play
    puts 'Nothing can be better then playing a game with a friend!'
    @mood += 3
    time_pass(1)
  end

  def sleep
    puts @name.to_s + 'falls asleep. Ca he have a dream?'
    @time -= 3
    @hunger -= 3
    @sleepness = 0
    grawing if @time <= 0
  end

  def status
    puts 'Health ' + @health.to_s
    puts 'Hunger ' + @hunger.to_s
    puts 'Sleepness ' + @sleepness.to_s
    puts 'Sickness ' + @sickness.to_s
    puts 'Mood ' + @mood.to_s
  end

  private

  def time_pass(t)
    @time -= t
    @hunger -= 1
    @sleepness += 1
    grawing if @time <= 0
    sleep if @sleepness >= 10
    death if @sickness >= 5 || @health < 0
    beast if @hunger <= 0
  end

  def grawing
    puts 'Your pet is growing. '
    @size += 1
    @age += 1
    @time = 10
  end

  def beast
    abort('A beast woke up. He eats you. You should feed your pet more often.')
  end

  def death
    abort('Your pet is dead. Is that what you were hoping for?')
  end
end

pet = Wolf.new 'Lapoo', 'wolf'
pet.help
pet.feed
pet.play
pet.hurt
pet.heal
pet.status
3.times { pet.play }
3.times { pet.play }
3.times { pet.play }
