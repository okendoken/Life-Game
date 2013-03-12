require "C:/Users/Philip/RubymineProjects/Life/lib/cell.rb"

FIELD_SIZE = 30

class Field

  def self.generate_random_field
    field = Array.new(FIELD_SIZE) do |i|
      Array.new(FIELD_SIZE) do |j|
        Cell.new({x: i, y: j})
      end
    end

    i = 0
    field.each do |line|
      j = 0
      line.each do |cell|
        cell.left= field[i - 1][j]
        cell.top_left= field[i - 1][j - 1]
        cell.top= field[i][j - 1]
        cell.top_right = field[i == FIELD_SIZE - 1 ? 0 : i + 1][j - 1]
        cell.right= field[i == FIELD_SIZE - 1 ? 0 : i + 1][j]
        cell.bottom_right= field[i == FIELD_SIZE - 1 ? 0 : i + 1][j == FIELD_SIZE - 1 ? 0 : j + 1]
        cell.bottom= field[i][j == FIELD_SIZE - 1 ? 0 : j + 1]
        cell.bottom_left= field[i - 1][j == FIELD_SIZE - 1 ? 0 : j + 1]
        j+=1
      end
      i+=1
    end

    field
  end

  def initialize
    @field = Field.generate_random_field
  end


  def to_s
    result = ''
    @field.each do |line|
      line.each do |cell|
        result << cell.to_s
      end
      result << "\n"
    end
    result
  end

  def reset_field
    @field.each do |line|
      line.each do |cell|
        cell.reset
      end
    end
  end

  def next_step
    @field.each do |line|
      line.each do |cell|
        if cell.dies?
          cell.schedule_death
        end
        if cell.continues_to_live?
          cell.continue_life
        end
        if cell.new_born?
          cell.schedule_life
        end
      end
    end

    self.reset_field
  end
end