# This class validates the Saudi National ID / Iqama Number.
#   It accepts the NID / Iqama in integer or string.
#   It also handles input stripping & Arabic digits conversion (١٢٣)
#   You can use it like:
#     NationalIdValidator.new('١٢٣٤٥٦٧٨٩٠').call
#     NationalIdValidator.new('1234567890').call
#     NationalIdValidator.new(1234567890).call
# 
#
# Responses:
#   -1 => Invalid Saudi NID / Iqama Number
#   1 => valid Saudi NID
#   2 => valid Iqama Number
#

class NationalIdValidator
  EN_DIGITS = "0123456789".freeze
  AR_DIGITS = "٠١٢٣٤٥٦٧٨٩".freeze
  EMPTY_STRING = "".freeze

  attr_reader :id_str, :id_num, :type

  def initialize(nid)
    @id_str = nid_formatter(nid)
    @type = id_str[0].to_i
    @id_num = id_str.to_i
  end

  def call
    return -1 unless id_str == id_num.to_s
    return -1 unless type == 1 || type == 2
    return -1 unless id_str.length == 10
    return -1 unless calculate_sum % 10 == 0

    type
  end

  private

    def nid_formatter(nid)
      nid
        .to_s
        .tr(AR_DIGITS, EN_DIGITS)
        .strip
    end

    def calculate_sum
      sum = 0

      id_num_arr = id_str.split(EMPTY_STRING).map(&:to_i)

      id_num_arr.each_with_index do |digit, i|
        if i % 2 == 0
          check_number = (digit * 2).to_s.rjust(2, '0')
          sum += check_number[0].to_i + check_number[1].to_i
        else
          sum += digit;
        end
      end

      sum
    end
end
