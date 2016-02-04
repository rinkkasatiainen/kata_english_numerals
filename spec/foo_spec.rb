require_relative 'spec_helper'


class EnglishNumerator
  def of ( arabicToEnglish )
    # TODO make class with constants of languae only EnglishNumbers
    least_siginificant_by_number = {
        0 => "",
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        # 5 => "two",
        # 6 => "two",
        # 7 => "two",
        # 8 => "two",
        9 => "nine",
        # 10 => "two",
        # 11 => "two",
        # 12 => "two",
        13 => "thirteen"
    }
    powers_of_ten_by_number = {
        0 => '',
        5 => "fifty",
    }

    ones = arabicToEnglish % 10
    tens = arabicToEnglish / 10 % 10
    hundreds = arabicToEnglish / 100 % 10
    remainderOfHundred = arabicToEnglish % 100

    if remainderOfHundred == 0
      return least_siginificant_by_number[hundreds] + " hundred"
    end
    if arabicToEnglish > 100
      return least_siginificant_by_number[hundreds] + " hundred" + " and " + of(remainderOfHundred)
    end
    if arabicToEnglish <= 13
      return least_siginificant_by_number[arabicToEnglish ]
    end
    if arabicToEnglish <= 19
      return least_siginificant_by_number[ones] + "teen"
    end
    return powers_of_ten_by_number[tens] + least_siginificant_by_number[ones]
  end

end

describe EnglishNumerator do

  numerator = EnglishNumerator.new

  context 'for numbers less than 14' do
    it 'boundary 1' do
      expect(numerator.of(1)).to eq "one"
    end

    it 'boundry 13' do
      expect(numerator.of(13)).to eq "thirteen"
    end
  end

  context 'for numbers less than 20' do
    it 'boundary 14' do
      expect(numerator.of(14)).to eq "fourteen"
    end
    it 'e.g. 19' do
      expect(numerator.of(19)).to eq "nineteen"
    end
  end

  context 'for numbers less than 100' do
    it 'dividable by ten, e.g. 50' do
      expect( numerator.of(50)).to eq "fifty"
    end
    it 'not dividable by ten, e.g. 54' do
      expect( numerator.of(54)).to eq "fiftyfour"
    end
  end

  context 'for numbers less than 1000' do
    it 'boundary of 100' do
      expect( numerator.of(100)).to eq "one hundred"
    end
    it '101' do
      expect( numerator.of(101)).to eq "one hundred and one"
    end
  end

end