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
		sum = 0
		input.split(/[,|\n]/).each { |number| sum = sum + number.to_i }
		sum
	end

	def replace_commas_and_newlines_with_pluses(input)
		input.gsub(/[,|\n]/, '+')	
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
