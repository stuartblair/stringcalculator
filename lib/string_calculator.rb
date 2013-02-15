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
			eval(replace_commas_and_newlines_with_pluses(input))
		end
	end		

	def replace_commas_and_newlines_with_pluses(input)
		input.gsub(/[,|\n]/, '+')	
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
