class Player
  def play_turn(warrior)
    @warrior = warrior
    if @warrior.feel.enemy?(get_dir)
      @warrior.attack!(get_dir)
    elsif @warrior.feel.empty?
      @warrior.walk!(dir)
    end
    # add your code here
  end
  def dir
    @dir = @warrior.direction_of_stairs
  end

end
