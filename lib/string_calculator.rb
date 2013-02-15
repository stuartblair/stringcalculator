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
		elements(input).inject(0) do |sum, number_text| 
				sum + numeric_value_of(number_text) unless numeric_value_of(number_text) > 1000
		end || 0
	end

	def numeric_value_of(number_text)
		number_text.to_i
	end

	def elements(input)
		input.split(/[,|\n]/)
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
