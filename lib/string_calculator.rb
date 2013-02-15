class StringCalculator
	def calc(input)
		if input.empty? then 
			return 0 
		else
			return evaluated_string(input)
		end
	end

	private

	def evaluated_string(input)
		if contains_negative_number(input) then
			raise RuntimeError, "Negative number found in the input"
		else
			evaluate_elements(input)
		end
	end	

	def evaluate_elements(input)
		valid_numbers_from(elements(input)).inject(0) do |sum, number| 
				sum + number unless number > 1000
		end || 0
	end

	def numeric_value_of(number_text)
		number_text.to_i
	end

	def elements(input)
		input.split(/[,|\n]/)
	end

	def valid_numbers_from(elements)
		elements.map { |element| numeric_value_of(element) }
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
