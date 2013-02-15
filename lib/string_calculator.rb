class StringCalculator
	def calc(input)
		if input.empty? then 
			return 0 
		else
			eval(replace_commas_and_newlines_with_pluses(input))
		end
	end

	private

	def replace_commas_and_newlines_with_pluses(input)
		input.gsub(/[,|\n]/, '+')	
	end
end
