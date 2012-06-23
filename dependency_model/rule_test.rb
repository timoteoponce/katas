
require './rule.rb'
require "test/unit"

class RuleTest < Test::Unit::TestCase

	class RuleA < Rule 
	end
	class RuleB < Rule 
	end

	def test1
		rule = Rule.new
		rule.depends_on RuleTest::RuleA, RuleTest::RuleB
		assert_equal( 2,rule.dependencies.size )
	end
end
