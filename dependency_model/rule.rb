
class Rule
	
	attr_reader :dependencies
	
	def initialize
		@dependencies = []
	end
	
	def depends_on *args
		args.each { |rule| @dependencies << rule }
	end	
	
	def to_s
		puts "#{self.class.name} => {"
		puts @dependencies.map{ |dependency|
			"#{dependency.to_s}"
		}.join(" , ") + "}"
	end
end
