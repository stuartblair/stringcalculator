module StringCalculator
	class Tokenizer
		def tokens(input)
			target(input).split(delimiter_pattern(delimiter_instruction(input)))
		end

		private

		def target(input)
			input.sub(/\/\/.*\n/, '')
		end

		def delimiter_instruction(input)
			input.match(/\/\/(.*)\n/)[1] unless !input.match(/\/\/.*\n/)
		end

		def delimiter_pattern(input)
			Regexp.new(custom_pattern(input))
		end

		def custom_pattern(input)
			custom_delimiters(input).inject(",|\n") do |pattern, custom_delimiter| 
				pattern += "|#{Regexp.escape(custom_delimiter)}"
			end
		end

		def custom_delimiters(input)
			if (!input) then return [] end
			input.scan(single_one_character_delimiter_pattern).flatten +
				input.scan(multiple_character_delimiter_pattern).flatten
		end

		def single_one_character_delimiter_pattern
			/^([^\[]).*/
		end

		def multiple_character_delimiter_pattern
			/\[([^\]]+)\]+/
		end
	end
end

