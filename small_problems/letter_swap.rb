
def swap(sentence)
  sentence_arr = sentence.split(' ')
  return_sentence = ''
    sentence_arr.each do |current_word|
    temp_arr = current_word.split('')
    temp_arr[0], temp_arr[-1] = temp_arr[-1], temp_arr[0]
    if return_sentence == ''
      return_sentence += temp_arr.join('')
    else
      return_sentence += ' ' + temp_arr.join('')
    end
    end
  return_sentence
end

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
