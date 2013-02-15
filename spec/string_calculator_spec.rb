require 'spec_helper'

describe StringCalculator
	context "when given an empty string" do
		it "returns 0" do
			string_calculator = StringCalculator.new
			string_calculator.calc("").should eql 0
		end
end
