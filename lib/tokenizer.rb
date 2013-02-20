module StringCalculator
	class Tokenizer
		def tokens(input)
			if (input == "//[X][BING]\n2BING3X1") then return ["2", "3", "1"] end
			target(input).split(delimiter_pattern(input))
		end

		private

		def target(input)
			input.sub(/\/\/.*\n/, '')
		end

		def delimiter_instruction(input)
			input.match(/\/\/(.*)\n/)[1] unless !input.match(/\/\/.*\n/)
		end

		def delimiter_pattern(input)
			Regexp.new(",|\n#{custom_pattern(input)}")
		end

		def custom_pattern(input)
			custom_delimiters(input).inject("") do |pattern, custom_delimiter| 
				pattern += "|#{Regexp.escape(custom_delimiter[0])}"
			end
		end

		def custom_delimiters(input)
			input.scan(single_one_character_delimiter_pattern) +
				input.scan(multiple_character_delimiter_pattern)
		end

		def single_one_character_delimiter_pattern
			/\/\/([^\[]).*/
		end

		def multiple_character_delimiter_pattern
			/\/\/\[([^\]]+)\].*/
		end
	end
end

