class StringCalculator
	def calc(input)
		if input.empty? then return 0 end
		eval(input.gsub(/[,|\n]/, '+'))
	end
end
