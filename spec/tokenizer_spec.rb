require 'spec_helper'
require 'tokenizer'

module StringCalculator
	describe Tokenizer do
		def tokenizer
			@tokenizer ||= Tokenizer.new
		end

		describe "#tokens" do
			it "treats a comma as a delimiter" do
				tokenizer.tokens("a,b").should eql ["a", "b"]
			end

			it "treats newline as a delimiter" do
				tokenizer.tokens("a\nb").should eql ["a", "b"]
			end

			it "interprets single character delimiters on the first line" do
				tokenizer.tokens("//*\n2*3").should eql ["2", "3"]
			end
		end
	end
end