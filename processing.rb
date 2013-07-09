require 'ruby-processing'

class FirstSketch < Processing::App
	def setup
		background(255,0,0)
	end

	def draw

		stroke(255,0,0)
		if @size.nil? || @size == 150
			@size = 1
		else
			@size = @size + 1
		end

		if @i.nil? || @i == 500
			@i = 0
		else
			@i= @i + 10
		end

		if @size0.nil? || @size0 == 0
			@size0 = 500
		else
			@size0 = @size0 - 1
		end

		if @i2.nil? || @i2 == 0
			@i2 = 500
		else
			@i2= @i - 10
		end

		fill(0,220,249)
		rect(@i,@i,@size,@size)
		oval(@i,@i,@size,@size)
		rect(@i2,@i2,@size0,@size0)
		oval(@i2,@i2,@size0,@size0)

	end
end

FirstSketch.new(:width => 400, :height => 400)