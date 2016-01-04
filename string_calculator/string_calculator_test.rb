require 'test-unit'
require_relative 'string_calculator'

class StringCalculatorTest < Test::Unit::TestCase
	setup do
		@calculator = StringCalculator.new
	end

	def test_add_empty_string
		expect_adding '', result: 0
	end

	def test_add_one_number
		expect_adding '1', result: 1
	end

	def test_add_two_numbers
		expect_adding '1,2', result: 3
	end

	def test_unknown_amount_of_numbers
		expect_adding '0,3,5,1', result: 9
	end

	def test_with_newlines
		expect_adding "1\n2,3", result: 6
	end

	def test_support_for_different_delimiter
		expect_adding "//;\n1;2", result: 3
	end

	def test_negative_numbers_raise_exception
		exc = assert_raise(RuntimeError) { @calculator.add('-9,2,-1') }
		assert_include exc.message, 'negatives not allowed:'
		assert_include exc.message, '-9'
		assert_include exc.message, '-1'
		assert_not_include exc.message, '2'
	end

	def test_ignore_numbers_major_1000
		expect_adding '1,1000,2,1001', result: 1003
	end

	# def test_delimiters_any_length
	# 	expect_adding '//[*p*]\n1*p*2', result: 3
	# end
  #
	# def test_multiple_delimiters
	# 	expect_adding '//[*][%]\n1*2%3', result: 6
	# end

	private

	def expect_adding(string, result: 0)
		assert_equal result, @calculator.add(string)
	end
end
