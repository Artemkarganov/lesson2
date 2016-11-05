require_relative 'colorize'
require 'yaml'

class Ball
  ANSWERS = YAML.load_file(File.join(__dir__, 'answers.yml'))

  def shake
    @a = rand(Ball::ANSWERS.size)
    text_color
    Ball::ANSWERS[@a]
  end

  def text_color
    case @a
    when 0..4 then color(31)
    when 5..9 then color(32)
    when 10..14 then color(33)
    else
      color(34)
    end
  end

  def color(color)
    puts Ball::ANSWERS[@a].to_s.colorize(color)
  end
end
