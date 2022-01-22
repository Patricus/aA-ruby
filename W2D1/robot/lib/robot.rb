class Robot
  attr_reader :position, :health

  def initialize
    @position = [0, 0]
    @health = 100
  end

  def move_left
    @position = [@position.first - 1, @position.last]
  end

  def move_right
    @position = [@position.first + 1, @position.last]
  end

  def move_up
    @position = [@position.first, @position.last + 1]
  end

  def move_down
    @position = [@position.first, @position.last - 1]
  end

  def items
    @items ||= []
  end

  def pick_up(item)
    if items_weight + item.weight > 250
      raise ArgumentError
    else
      carrying = items
      carrying << item
    end

    def equipped_weapon
      @equipped_weapon ||= nil
    end

    def equipped_weapon=(weapon = nil)
      @equipped_weapon = weapon
    end
  end

  def items_weight
    carrying = items
    carrying.sum { |item| item.weight }
  end

  def wound(amount)
    @health -= amount
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def attack(other_robot)
    equipped_weapon ? equipped_weapon.hit(other_robot) : other_robot.wound(5)
  end
end

class Item
  attr_reader :name, :weight
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end

class Bolts < Item
  def initialize
    @name = 'bolts'
    @weight = 25
  end

  def feed(robot)
    robot.heal(25)
  end
end

class Weapon < Item
  attr_accessor :damage
  def initialize(name, weight, damage)
    @name = name
    @weight = weight
    @damage = damage
  end

  def hit(target)
    target.wound(45)
  end
end

class Laser < Weapon
  def initialize
    @name = 'laser'
    @weight = 125
    @damage = 25
  end
end

class PlasmaCannon < Weapon
  def initialize
    @name = 'plasma_cannon'
    @weight = 200
    @damage = 55
  end
end
