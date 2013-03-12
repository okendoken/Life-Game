class Cell
  attr_reader :value, :left, :top, :right, :bottom, :top_left, :top_right, :bottom_left, :bottom_right

  def initialize (position, value = rand(2))
    @next_value = @value = value
    @position = position
  end

  def neighbours_count
    begin
    self.left.value + self.top.value + self.right.value + self.bottom.value +
        self.top_left.value + self.top_right.value + self.bottom_right.value + self.bottom_left.value
    rescue Object => e
      puts e
    end
  end

  def dies?
    self.neighbours_count < 2 or self.neighbours_count >= 4
  end

  def continues_to_live?
    self.alive? and (self.neighbours_count == 2 or self.neighbours_count == 3)
  end

  def new_born?
    self.neighbours_count == 3
  end


  def alive?
    @value == 1
  end

  def schedule_death
    @next_value = 0
  end

  def schedule_life
    @next_value = 1
  end

  def continue_life
    #@next_value = 1
  end

  def reset
    @value = @next_value
  end

  def to_s
    @value == 1 ? '*' : ' '
  end

  def left=(left)
    @left = left
  end

  def top=(top)
    @top = top
  end

  def right=(right)
    @right = right
  end

  def bottom=(bottom)
    @bottom = bottom
  end

  def top_left=(x)
    @top_left = x
  end

  def top_right=(x)
    @top_right = x
  end

  def bottom_right=(x)
    @bottom_right = x
  end

  def bottom_left=(x)
    @bottom_left = x
  end
end