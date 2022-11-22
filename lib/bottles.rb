# frozen_string_literal: true

# 99 bottles of beer
class Bottles
  LAST_VERSE = 'No more bottles of beer on the wall, ' \
  "no more bottles of beer.\n" \
  'Go to the store and buy some more, ' \
  "99 bottles of beer on the wall.\n"

  NR_OF_VERSES = 99

  def song
    verses(NR_OF_VERSES, 0)
  end

  def verses(from, to)
    from.downto(to).map do |v|
      verse(v)
    end.join("\n")
  end

  def verse(bottles)
    return LAST_VERSE unless bottles.positive?

    verse_builder(bottles)
  end

  def verse_builder(bottles)
    left = bottles > 1 ? (bottles - 1).to_s : 'no more'
    "#{bottles} #{singular_or_plural(bottles)} of beer on the wall, " \
    "#{bottles} #{singular_or_plural(bottles)} of beer.\n" \
    "Take #{it_or_one(bottles)} down and pass it around, " \
    "#{left} #{singular_or_plural(bottles - 1)} of beer on the wall.\n"
  end

  def it_or_one(bottles)
    bottles == 1 ? 'it' : 'one'
  end

  def singular_or_plural(bottles)
    bottles == 1 ? 'bottle' : 'bottles'
  end
end
