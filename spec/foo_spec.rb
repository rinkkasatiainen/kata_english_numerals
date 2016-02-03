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
        # 9 => "two",
        # 10 => "two",
        # 11 => "two",
        # 12 => "two",
        # 13 => "two",
    }
    powers_of_ten_by_number = {
        0 => '',
        5 => "fifty",
    }
    if arabicToEnglish > 19
      return powers_of_ten_by_number[arabicToEnglish / 10] + least_siginificant_by_number[arabicToEnglish % 10]
    end
    if arabicToEnglish > 13
      return least_siginificant_by_number[arabicToEnglish - 10] + "teen"
    end
    least_siginificant_by_number[arabicToEnglish]
  end

end

describe EnglishNumerator do

  numerator = EnglishNumerator.new

  context 'for numbers less than 14' do
    it 'e.g. 1' do
      expect(numerator.of(1)).to eq "one"
    end

    #we need one for 13
  end

  context 'for numbers less than 20' do
    it 'e.g. 14' do
      expect(numerator.of(14)).to eq "fourteen"
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

end