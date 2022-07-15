# Duck Typing Example

class Match
  attr_reader :sections, :players, :songs

  def prepare(preparers)
    preparers.each do |preparer|
      preparer.prepare_for_match(self)
    end
  end
end

class Custodian
  def prepare_for_match(match)
    clean_stadium(match.sections)
  end

  def clean_stadium(sections)
    #implementation
  end
end

class Coach
  def prepare_for_match(match)
    motivate_players(match.players)
  end

  def motivate_players(players)
    # implementation
  end
end

class DJ
  def prepare_for_match(match)
    prepare_haltime_music(match.songs)
  end

  def prepare_haltime_music(songs)
    #implementation
  end
end