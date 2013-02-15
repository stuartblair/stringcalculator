require 'spec_helper'
require 'string_calculator'

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

		it "throws and exception if the string contains a negative number" do
			expect { string_calculator.calc("-2") }.to throw_symbol(:negative_number)
		end
	end
end
