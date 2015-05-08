module Converter

  def converter square
    alphabet = ('a'..'z').to_a
    row, col = square.downcase.split(//,2)
    coords = alphabet.index(row), (col.to_i)-1
  end

end