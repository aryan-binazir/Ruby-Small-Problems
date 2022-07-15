require 'minitest/autorun'
require_relative 'text_exercise'

class TextTest < MiniTest::Test
  def setup
    @file = File.open("sample.txt")
  end

  def test_swap
    text = Text.new(@file.read)
    actual_output = text.swap('a', 'e')
    expected_output = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    assert_equal(expected_output, actual_output)
  end

  def test_word_count
    text = Text.new(@file.read)
    count = text.word_count
    # expected_count = text.text.split.count
    assert_equal(72, count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
