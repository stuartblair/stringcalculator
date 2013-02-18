require 'tokenizer'

module StringCalculator
	class StringCalculator
		def calc(input)
			valid_numbers_from(elements(input)).inject(0) do |sum, number| 
				sum + number 
			end 
		end

		private

		def valid_numbers_from(elements)
			elements.map { |element| valid_number_from(numeric_value_of(element)) }
		end

		def elements(input)
			Tokenizer.new.tokens(input)
		end

		def valid_number_from(number)
			if number < 0 then
				raise RuntimeError, "Negative number found in the input"
			elsif number <= 1000 then 
				number
			else 
				0 
			end
		end

		def numeric_value_of(number_text)
			number_text.to_i
		end
	end
end

