class DeerSong
  attr_reader :bottles

  def initialize(bottles)
    @bottles = bottles
  end

  def verse
    case bottles
    when 2
      two_bottle_verse
    when 1
      one_bottle_verse
    when 0
      zero_bottle_verse
    else
      default_verse
    end
  end

  def default_verse
    "#{bottles} bottles of deer on the wall, #{bottles}" \
      " bottles of deer.\nTake one down and pass it around, " \
      "#{bottles - 1} bottles of deer on the wall.\n"
  end

  def two_bottle_verse
    "2 bottles of deer on the wall, 2 bottles of deer.\n" \
      'Take one down and pass it around, 1 bottle of deer ' \
      "on the wall.\n"
  end

  def one_bottle_verse
    "1 bottle of deer on the wall, 1 bottle of deer.\n" \
      'Take it down and pass it around, no more bottles of deer ' \
      "on the wall.\n"
  end

  def zero_bottle_verse
    'No more bottles of deer on the wall, no more bottles ' \
      "of deer.\nGo to the store and buy some more, 99 bottles " \
      "of deer on the wall.\n"
  end

  def self.verse(bottles)
    DeerSong.new(bottles).verse
  end

  def self.verses(first, last)
    output = []
    first.downto(last) { |bottle| output << DeerSong.new(bottle).verse }
    output.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end
