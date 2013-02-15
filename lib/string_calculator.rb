class StringCalculator
	def calc(input)
		evaluate_elements(input)
	end

	private

	def evaluate_elements(input)
		valid_numbers_from(elements(input)).inject(0) do |sum, number| 
			sum + number 
		end 
	end

	def numeric_value_of(number_text)
		number_text.to_i
	end

	def elements(input)
		input.split(/[,|\n]/)
	end

	def valid_numbers_from(elements)
		elements.map { |element| valid_number_from(numeric_value_of(element)) }
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

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
