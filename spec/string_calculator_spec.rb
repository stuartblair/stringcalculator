require 'spec_helper'
require 'string_calculator'

module StringCalculator
	describe StringCalculator do
		def string_calculator
			@string_calculator
		end

		before(:each) do
			@string_calculator = StringCalculator.new
		end

		describe "calc" do
			it "returns 0 when given an empty string" do
				string_calculator.calc("").should eql 0
			end

			it "returns the number from the string when given a single number" do
				string_calculator.calc("2").should eql 2
			end

			it "returns the sum of two comma delimited numbers" do
				string_calculator.calc("2,3").should eql 5
			end

			it "returns the sum of two newline delimited numbers" do 
				string_calculator.calc("2\n3").should eql 5
			end

			it "returns the sum of three numbers delimited either way" do
				string_calculator.calc("2\n3,4").should eql 9
			end

			it "throws an exception if the string contains a negative number" do
				expect { string_calculator.calc("-2") }.to raise_error(RuntimeError)
			end

			it "ignores numbers greater than 1000" do
				string_calculator.calc("1001").should eql 0
			end

			it "interprets delimiters appearing on the first line" do
				string_calculator.calc("//#\n2#3").should eql 5
			end

			it "interprets multicharacter delimiters appearing on the first line" do
				string_calculator.calc("//[###]\n2###3").should eql 5
			end

			it "interprets multiple variable length delimiters appearing on the first line" do
				string_calculator.calc("//[X][BING]\n2BING3X1").should eql 6
			end
		end
	end
end
