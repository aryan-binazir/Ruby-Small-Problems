require 'minitest/autorun'
require_relative 'deer_song'

# rubocop:disable Metrics/LineLength
class DeerSongTest < Minitest::Test
  def test_the_first_verse
    expected = "99 bottles of deer on the wall, 99 bottles of deer.\n" \
      "Take one down and pass it around, 98 bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verse(99)
  end

  def test_another_verse
    expected = "3 bottles of deer on the wall, 3 bottles of deer.\n" \
      "Take one down and pass it around, 2 bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verse(3)
  end

  def test_verse_2
    expected = "2 bottles of deer on the wall, 2 bottles of deer.\n" \
      "Take one down and pass it around, 1 bottle of deer on the wall.\n"
    assert_equal expected, DeerSong.verse(2)
  end

  def test_verse_1
    expected = "1 bottle of deer on the wall, 1 bottle of deer.\n" \
      "Take it down and pass it around, no more bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verse(1)
  end

  def test_verse_0
    expected = "No more bottles of deer on the wall, no more bottles of deer.\n" \
      "Go to the store and buy some more, 99 bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verse(0)
  end

  def test_a_couple_verses
    expected = "99 bottles of deer on the wall, 99 bottles of deer.\n" \
      "Take one down and pass it around, 98 bottles of deer on the wall.\n" \
      "\n" \
      "98 bottles of deer on the wall, 98 bottles of deer.\n" \
      "Take one down and pass it around, 97 bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verses(99, 98)
  end

  def test_a_few_verses
    expected = "2 bottles of deer on the wall, 2 bottles of deer.\n" \
      "Take one down and pass it around, 1 bottle of deer on the wall.\n" \
      "\n" \
      "1 bottle of deer on the wall, 1 bottle of deer.\n" \
      "Take it down and pass it around, no more bottles of deer on the wall.\n" \
      "\n" \
      "No more bottles of deer on the wall, no more bottles of deer.\n" \
      "Go to the store and buy some more, 99 bottles of deer on the wall.\n"
    assert_equal expected, DeerSong.verses(2, 0)
  end

  def test_the_whole_song # rubocop:disable Metrics/MethodLength
    expected = <<-SONG
99 bottles of deer on the wall, 99 bottles of deer.
Take one down and pass it around, 98 bottles of deer on the wall.

98 bottles of deer on the wall, 98 bottles of deer.
Take one down and pass it around, 97 bottles of deer on the wall.

97 bottles of deer on the wall, 97 bottles of deer.
Take one down and pass it around, 96 bottles of deer on the wall.

96 bottles of deer on the wall, 96 bottles of deer.
Take one down and pass it around, 95 bottles of deer on the wall.

95 bottles of deer on the wall, 95 bottles of deer.
Take one down and pass it around, 94 bottles of deer on the wall.

94 bottles of deer on the wall, 94 bottles of deer.
Take one down and pass it around, 93 bottles of deer on the wall.

93 bottles of deer on the wall, 93 bottles of deer.
Take one down and pass it around, 92 bottles of deer on the wall.

92 bottles of deer on the wall, 92 bottles of deer.
Take one down and pass it around, 91 bottles of deer on the wall.

91 bottles of deer on the wall, 91 bottles of deer.
Take one down and pass it around, 90 bottles of deer on the wall.

90 bottles of deer on the wall, 90 bottles of deer.
Take one down and pass it around, 89 bottles of deer on the wall.

89 bottles of deer on the wall, 89 bottles of deer.
Take one down and pass it around, 88 bottles of deer on the wall.

88 bottles of deer on the wall, 88 bottles of deer.
Take one down and pass it around, 87 bottles of deer on the wall.

87 bottles of deer on the wall, 87 bottles of deer.
Take one down and pass it around, 86 bottles of deer on the wall.

86 bottles of deer on the wall, 86 bottles of deer.
Take one down and pass it around, 85 bottles of deer on the wall.

85 bottles of deer on the wall, 85 bottles of deer.
Take one down and pass it around, 84 bottles of deer on the wall.

84 bottles of deer on the wall, 84 bottles of deer.
Take one down and pass it around, 83 bottles of deer on the wall.

83 bottles of deer on the wall, 83 bottles of deer.
Take one down and pass it around, 82 bottles of deer on the wall.

82 bottles of deer on the wall, 82 bottles of deer.
Take one down and pass it around, 81 bottles of deer on the wall.

81 bottles of deer on the wall, 81 bottles of deer.
Take one down and pass it around, 80 bottles of deer on the wall.

80 bottles of deer on the wall, 80 bottles of deer.
Take one down and pass it around, 79 bottles of deer on the wall.

79 bottles of deer on the wall, 79 bottles of deer.
Take one down and pass it around, 78 bottles of deer on the wall.

78 bottles of deer on the wall, 78 bottles of deer.
Take one down and pass it around, 77 bottles of deer on the wall.

77 bottles of deer on the wall, 77 bottles of deer.
Take one down and pass it around, 76 bottles of deer on the wall.

76 bottles of deer on the wall, 76 bottles of deer.
Take one down and pass it around, 75 bottles of deer on the wall.

75 bottles of deer on the wall, 75 bottles of deer.
Take one down and pass it around, 74 bottles of deer on the wall.

74 bottles of deer on the wall, 74 bottles of deer.
Take one down and pass it around, 73 bottles of deer on the wall.

73 bottles of deer on the wall, 73 bottles of deer.
Take one down and pass it around, 72 bottles of deer on the wall.

72 bottles of deer on the wall, 72 bottles of deer.
Take one down and pass it around, 71 bottles of deer on the wall.

71 bottles of deer on the wall, 71 bottles of deer.
Take one down and pass it around, 70 bottles of deer on the wall.

70 bottles of deer on the wall, 70 bottles of deer.
Take one down and pass it around, 69 bottles of deer on the wall.

69 bottles of deer on the wall, 69 bottles of deer.
Take one down and pass it around, 68 bottles of deer on the wall.

68 bottles of deer on the wall, 68 bottles of deer.
Take one down and pass it around, 67 bottles of deer on the wall.

67 bottles of deer on the wall, 67 bottles of deer.
Take one down and pass it around, 66 bottles of deer on the wall.

66 bottles of deer on the wall, 66 bottles of deer.
Take one down and pass it around, 65 bottles of deer on the wall.

65 bottles of deer on the wall, 65 bottles of deer.
Take one down and pass it around, 64 bottles of deer on the wall.

64 bottles of deer on the wall, 64 bottles of deer.
Take one down and pass it around, 63 bottles of deer on the wall.

63 bottles of deer on the wall, 63 bottles of deer.
Take one down and pass it around, 62 bottles of deer on the wall.

62 bottles of deer on the wall, 62 bottles of deer.
Take one down and pass it around, 61 bottles of deer on the wall.

61 bottles of deer on the wall, 61 bottles of deer.
Take one down and pass it around, 60 bottles of deer on the wall.

60 bottles of deer on the wall, 60 bottles of deer.
Take one down and pass it around, 59 bottles of deer on the wall.

59 bottles of deer on the wall, 59 bottles of deer.
Take one down and pass it around, 58 bottles of deer on the wall.

58 bottles of deer on the wall, 58 bottles of deer.
Take one down and pass it around, 57 bottles of deer on the wall.

57 bottles of deer on the wall, 57 bottles of deer.
Take one down and pass it around, 56 bottles of deer on the wall.

56 bottles of deer on the wall, 56 bottles of deer.
Take one down and pass it around, 55 bottles of deer on the wall.

55 bottles of deer on the wall, 55 bottles of deer.
Take one down and pass it around, 54 bottles of deer on the wall.

54 bottles of deer on the wall, 54 bottles of deer.
Take one down and pass it around, 53 bottles of deer on the wall.

53 bottles of deer on the wall, 53 bottles of deer.
Take one down and pass it around, 52 bottles of deer on the wall.

52 bottles of deer on the wall, 52 bottles of deer.
Take one down and pass it around, 51 bottles of deer on the wall.

51 bottles of deer on the wall, 51 bottles of deer.
Take one down and pass it around, 50 bottles of deer on the wall.

50 bottles of deer on the wall, 50 bottles of deer.
Take one down and pass it around, 49 bottles of deer on the wall.

49 bottles of deer on the wall, 49 bottles of deer.
Take one down and pass it around, 48 bottles of deer on the wall.

48 bottles of deer on the wall, 48 bottles of deer.
Take one down and pass it around, 47 bottles of deer on the wall.

47 bottles of deer on the wall, 47 bottles of deer.
Take one down and pass it around, 46 bottles of deer on the wall.

46 bottles of deer on the wall, 46 bottles of deer.
Take one down and pass it around, 45 bottles of deer on the wall.

45 bottles of deer on the wall, 45 bottles of deer.
Take one down and pass it around, 44 bottles of deer on the wall.

44 bottles of deer on the wall, 44 bottles of deer.
Take one down and pass it around, 43 bottles of deer on the wall.

43 bottles of deer on the wall, 43 bottles of deer.
Take one down and pass it around, 42 bottles of deer on the wall.

42 bottles of deer on the wall, 42 bottles of deer.
Take one down and pass it around, 41 bottles of deer on the wall.

41 bottles of deer on the wall, 41 bottles of deer.
Take one down and pass it around, 40 bottles of deer on the wall.

40 bottles of deer on the wall, 40 bottles of deer.
Take one down and pass it around, 39 bottles of deer on the wall.

39 bottles of deer on the wall, 39 bottles of deer.
Take one down and pass it around, 38 bottles of deer on the wall.

38 bottles of deer on the wall, 38 bottles of deer.
Take one down and pass it around, 37 bottles of deer on the wall.

37 bottles of deer on the wall, 37 bottles of deer.
Take one down and pass it around, 36 bottles of deer on the wall.

36 bottles of deer on the wall, 36 bottles of deer.
Take one down and pass it around, 35 bottles of deer on the wall.

35 bottles of deer on the wall, 35 bottles of deer.
Take one down and pass it around, 34 bottles of deer on the wall.

34 bottles of deer on the wall, 34 bottles of deer.
Take one down and pass it around, 33 bottles of deer on the wall.

33 bottles of deer on the wall, 33 bottles of deer.
Take one down and pass it around, 32 bottles of deer on the wall.

32 bottles of deer on the wall, 32 bottles of deer.
Take one down and pass it around, 31 bottles of deer on the wall.

31 bottles of deer on the wall, 31 bottles of deer.
Take one down and pass it around, 30 bottles of deer on the wall.

30 bottles of deer on the wall, 30 bottles of deer.
Take one down and pass it around, 29 bottles of deer on the wall.

29 bottles of deer on the wall, 29 bottles of deer.
Take one down and pass it around, 28 bottles of deer on the wall.

28 bottles of deer on the wall, 28 bottles of deer.
Take one down and pass it around, 27 bottles of deer on the wall.

27 bottles of deer on the wall, 27 bottles of deer.
Take one down and pass it around, 26 bottles of deer on the wall.

26 bottles of deer on the wall, 26 bottles of deer.
Take one down and pass it around, 25 bottles of deer on the wall.

25 bottles of deer on the wall, 25 bottles of deer.
Take one down and pass it around, 24 bottles of deer on the wall.

24 bottles of deer on the wall, 24 bottles of deer.
Take one down and pass it around, 23 bottles of deer on the wall.

23 bottles of deer on the wall, 23 bottles of deer.
Take one down and pass it around, 22 bottles of deer on the wall.

22 bottles of deer on the wall, 22 bottles of deer.
Take one down and pass it around, 21 bottles of deer on the wall.

21 bottles of deer on the wall, 21 bottles of deer.
Take one down and pass it around, 20 bottles of deer on the wall.

20 bottles of deer on the wall, 20 bottles of deer.
Take one down and pass it around, 19 bottles of deer on the wall.

19 bottles of deer on the wall, 19 bottles of deer.
Take one down and pass it around, 18 bottles of deer on the wall.

18 bottles of deer on the wall, 18 bottles of deer.
Take one down and pass it around, 17 bottles of deer on the wall.

17 bottles of deer on the wall, 17 bottles of deer.
Take one down and pass it around, 16 bottles of deer on the wall.

16 bottles of deer on the wall, 16 bottles of deer.
Take one down and pass it around, 15 bottles of deer on the wall.

15 bottles of deer on the wall, 15 bottles of deer.
Take one down and pass it around, 14 bottles of deer on the wall.

14 bottles of deer on the wall, 14 bottles of deer.
Take one down and pass it around, 13 bottles of deer on the wall.

13 bottles of deer on the wall, 13 bottles of deer.
Take one down and pass it around, 12 bottles of deer on the wall.

12 bottles of deer on the wall, 12 bottles of deer.
Take one down and pass it around, 11 bottles of deer on the wall.

11 bottles of deer on the wall, 11 bottles of deer.
Take one down and pass it around, 10 bottles of deer on the wall.

10 bottles of deer on the wall, 10 bottles of deer.
Take one down and pass it around, 9 bottles of deer on the wall.

9 bottles of deer on the wall, 9 bottles of deer.
Take one down and pass it around, 8 bottles of deer on the wall.

8 bottles of deer on the wall, 8 bottles of deer.
Take one down and pass it around, 7 bottles of deer on the wall.

7 bottles of deer on the wall, 7 bottles of deer.
Take one down and pass it around, 6 bottles of deer on the wall.

6 bottles of deer on the wall, 6 bottles of deer.
Take one down and pass it around, 5 bottles of deer on the wall.

5 bottles of deer on the wall, 5 bottles of deer.
Take one down and pass it around, 4 bottles of deer on the wall.

4 bottles of deer on the wall, 4 bottles of deer.
Take one down and pass it around, 3 bottles of deer on the wall.

3 bottles of deer on the wall, 3 bottles of deer.
Take one down and pass it around, 2 bottles of deer on the wall.

2 bottles of deer on the wall, 2 bottles of deer.
Take one down and pass it around, 1 bottle of deer on the wall.

1 bottle of deer on the wall, 1 bottle of deer.
Take it down and pass it around, no more bottles of deer on the wall.

No more bottles of deer on the wall, no more bottles of deer.
Go to the store and buy some more, 99 bottles of deer on the wall.
    SONG
    assert_equal expected, DeerSong.lyrics
  end
end