class StringCalculator
	def calc(input)
		if input.empty? then 
			return 0 
		else
			if contains_negative_number(input) then
				raise RuntimeError, "Negative number found in the input"
			else
				eval(replace_commas_and_newlines_with_pluses(input))
			end
		end
	end

	private

	def replace_commas_and_newlines_with_pluses(input)
		input.gsub(/[,|\n]/, '+')	
	end

	def contains_negative_number(input)
		(input =~ /-\d/) != nil
	end
end
