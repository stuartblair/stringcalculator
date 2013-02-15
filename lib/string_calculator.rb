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
		input.split(/[,|\n]/).inject(0) do |sum, number| 
			if (number.to_i <= 1000) then
				sum + number.to_i 
			end
		end
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
