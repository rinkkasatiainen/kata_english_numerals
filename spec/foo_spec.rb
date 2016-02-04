require_relative 'spec_helper'


class EnglishNumerator
  def of ( arabicToEnglish )
    # TODO make class with constants of language only EnglishNumbers
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
    }
    powers_of_ten_by_number = {
        0 => '',
        2 => "twenty",
        5 => "fifty",
    }

    # split into ones, tens and hundreds
    # - language specific special cases or ranges
    # translate ones, tens, hundreds
    # concat and "and"

    # # idea 1
    # translate(arabicToEnglish).with(
    #     {
    #         1 => translate_ones,
    #         10 => translate_tens,
    #         100 => translate_ons
    #     # how to handle 13?
    #     }
    # ).compose_with( compose_as_text_with_and )

    # # idea 2
    # numbersToEnglish = split_powers <> translateTo(english()) <> joinWith("and", "", "")

    # # idea 3
    # join_powers_with_and(
    #   translate_powers(
    #     split_into_powers(arabicToEnglish)
    #   )
    # )

    specials = {
        11 => "eleven",
        13 => "thirteen",
        14 => "fourteen",
        19 => "nineteen"
    }

    ones = arabicToEnglish % 10

    if specials.include? arabicToEnglish
      return specials[arabicToEnglish]
    end
    if arabicToEnglish <= 99
      tens = arabicToEnglish / 10 % 10
      return powers_of_ten_by_number[tens] + least_siginificant_by_number[ones]
    end
    if arabicToEnglish <= 999
      hundreds = arabicToEnglish / 100 % 10
      remainderOfHundred = arabicToEnglish % 100
      add_with_and(of(hundreds) + " hundred", of(remainderOfHundred) )
    end
  end

  def add_with_and( hundreds, remainder )
    return hundreds + ( remainder.empty? ? "" : " and #{remainder}" )
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
    it 'boundary 19' do
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
    it 'e.g. 101' do
      expect( numerator.of(101)).to eq "one hundred and one"
    end
    it 'e.g. 324' do
      expect( numerator.of(324)).to eq "three hundred and twentyfour"
    end
  end

end