module StringCalculator
	class Tokenizer
		def tokens(input)
			target(input).split(delimiter_pattern(input))
		end

		private

		def target(input)
			input.sub(/\/\/.*\n/, '')
		end

		def delimiter_pattern(input)
			Regexp.new("[,|\n#{custom_pattern(input)}]")
		end

		def custom_pattern(input)
			if (custom_delimiter(input)) then
				"|#{custom_delimiter(input)}"
			else 
				""
			end
		end

		def custom_delimiter(input)
			find_custom_delimiter_pattern = /\/\/(.).*/ 
				input.match(find_custom_delimiter_pattern)[1] unless !input.match(find_custom_delimiter_pattern)
		end
	end
end
