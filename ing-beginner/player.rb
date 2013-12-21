class Player
  def play_turn(warrior)
    @warrior = warrior
    @enemy = ['Wizard', 'Archer', 'Thick Sludge', 'Sludge']
    look
    dir
    hab
    @health = @warrior.health
  end
  def hab
    if @warrior.feel.enemy?
      @warrior.attack!
      @captive = :captive if @a == nil
      @captive = :rescued if @a == 1
    elsif @enemy.include?(@look_back[2].to_s) || (@look_back[1].to_s == 'Captive' && @wall == nil)
      @warrior.pivot!
    elsif @enemy.include?(@pos0) || (@pos0 == 'nothing'&& @enemy.include?(@pos1)) || ((@pos0 == 'nothing') && ((@pos1 == 'nothing' ) && (@enemy.include?(@pos2))))
      @warrior.shoot!
    elsif @pos0 == 'Captive'
      if @warrior.feel(@dir).captive?
        @warrior.rescue!(@dir)
        @captive = :rescued
        @a = 1
      end
    elsif @warrior.feel.wall?
      @warrior.pivot!
      @wall = 1
    elsif (@warrior.feel.empty? && @warrior.health >= 14) || (@health > @warrior.health) || (@warrior.feel.stairs?)
      @warrior.walk!(@dir)
    else
      @warrior.rest!
    end
  end
  def dir
      if (@warrior.health < 14)
        @dir = :backward
      elsif (@warrior.health > 13)  || (@health > @warrior.health)
        @dir = :forward
      end
  end
  def look
    @look_front = @warrior.look
    @look_back = @warrior.look(:backward)
    if  (@look_back[0].to_s == 'nothing' && @look_back[1].to_s == 'Captive') || (@look_back[0].to_s == 'nothing' && @look_back[1].to_s == 'nothing' && (@look_back[2].to_s == 'Archer' || @look_back[2].to_s == 'Captive') && @a == 0)
      @look = @look_back
    else
      @look = @look_front
    end
    @pos0 = @look[0].to_s
    @pos1 = @look[1].to_s
    @pos2 = @look[2].to_s
  end
end


