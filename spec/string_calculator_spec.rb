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
	end
end
