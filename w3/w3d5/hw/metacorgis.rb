require 'byebug'

class ShoppingList
  DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "happiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "happiness" => 33
      },
      "silly_outfit" => {
        "info" => "A tiny Ronald McDonald costume",
        "happiness" => 0
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "happiness" => 31
      },
      "kibble" => {
        "info" => "An old dirty shoe",
        "happiness" => 32
      },
      "silly_outfit" => {
        "info" => "A muddy puddle to roll in",
        "happiness" => 8
      }
    },
    3 => {
      "bone" => {
        "info" => "A rock",
        "happiness" => 4
      },
      "kibble" => {
        "info" => "Avocado skins",
        "happiness" => 17
      },
      "silly_outfit" => {
        "info" => "A Warriors uniform",
        "happiness" => 24
      }
    }
  }

  def initialize(data = DATA)
    @internal_hash = data
  end

  def method_missing(name, id, *args)
    name = name.to_s
    if name.start_with?("get_")
      name.match(/^get_(.*)_(info|happiness)$/)
      perk = $1
      attribute = name.split('_').last
      @internal_hash[id][perk][attribute]
    else
      super
    end
  end

 #  def get_bone_info(id)
 #     @internal_hash[id]["bone"]["info"]
 #   end
 #
 #  def get_bone_happiness(id)
 #    @internal_hash[id]["bone"]["happiness"]
 #  end
 #
 #  def get_kibble_info(id)
 #   @internal_hash[id]["kibble"]["info"]
 # end
 #
 #  def get_kibble_happiness(id)
 #    @internal_hash[id]["kibble"]["happiness"]
 #  end

  # def get_silly_outfit_info(id)
  #   @internal_hash[id]["silly_outfit"]["info"]
  # end
  #
  # def get_silly_outfit_happiness(id)
  #   @internal_hash[id]["silly_outfit"]["happiness"]
  # end
end

class CorgiPerk

  def initialize(perk_id, shopping_list)
    @id = perk_id
    @shopping_list = shopping_list
  end

  def bone
    info = @shopping_list.get_bone_info(@id)
    happiness = @shopping_list.get_bone_happiness(@id)
    result = "Bone: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @shopping_list.get_kibble_info(@id)
    happiness = @shopping_list.get_kibble_happiness(@id)
    result = "Kibble: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

  def silly_outfit
    info = @shopping_list.get_silly_outfit_info(@id)
    happiness = @shopping_list.get_silly_outfit_happiness(@id)
    result = "Silly Outfit: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end
end

class CorgiPerk2
  # the method_missing CorgiPerk class

  def initialize(perk_id, shopping_list)
    @id = perk_id
    @shopping_list = shopping_list
  end

  def method_missing(name, *args)
    info = @shopping_list.send("get_#{name}_info", @id)
    happiness = @shopping_list.send("get_#{name}_happiness", @id)
    name = name.to_s.split('_').map(&:capitalize).join(' ')
    result = "#{name}: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end

end

class CorgiPerk3
  # the dynamic dispatch CorgiPerk class

  def initialize(perk_id, shopping_list)
    @id = perk_id
    @shopping_list = shopping_list
    shopping_list.methods.grep(/^get_(.*)_info$/) { CorgiPerk3.define_perk $1}
  end

  # Less structure to help you with this one :)
  def self.define_perk(perk)
    define_method(perk) do
      info = @shopping_list.send("get_#{perk}_info", @id)
      happiness = @shopping_list.send("get_#{perk}_happiness", @id)
      perk = perk.split('_').map(&:capitalize).join(' ')
      result = "#{perk}: #{info}: #{happiness} licks"
      happiness > 30 ? "* #{result}" : result
    end
  end
end

class CorgiPerk4

  def initialize(perk_id, shopping_list)
    @id = perk_id
    @shopping_list = shopping_list
  end

  def method_missing(perk)
    perk = perk.to_s
    info = @shopping_list.send("get_#{perk}_info", @id)
    happiness = @shopping_list.send("get_#{perk}_happiness", @id)
    perk = perk.split('_').map(&:capitalize).join(' ')
    result = "#{perk}: #{info}: #{happiness} licks"
    happiness > 30 ? "* #{result}" : result
  end
end


shopping_list = ShoppingList.new
cor1 = CorgiPerk.new(1, ShoppingList.new)
cor2 = CorgiPerk2.new(2, ShoppingList.new)
cor3 = CorgiPerk3.new(3, ShoppingList.new)
cor4 = CorgiPerk4.new(3, ShoppingList.new)

p cor1.bone
p cor2.kibble
p cor4.silly_outfit
# cor4 works with DRY'd shopping list

p cor3.silly_outfit
# cor3 works with original shopping list
