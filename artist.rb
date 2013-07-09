require 'ruby-processing'
class ProcessArtist < Processing::App

#This is a good start.
	
  	def setup
    	background(0, 0, 0)
    	@w=0
	    @h=0
	    rect_mode CENTER
	    ellipse_mode CENTER
  	end

  	def draw
  	end

  	def mouse_pressed
  		warn "The mouse key has been pressed"
  		if @shape == :rectangle
  			draw_rectangle
  		elsif @shape == :oval
  			draw_oval
  		end
  	end

  	def draw_rectangle
  		rect(mouse_x, mouse_y, @w, @h)
  	end

  	def draw_oval
  		oval(mouse_x, mouse_y, @w, @h)
  	end

  	def mouse_released
  		warn "The mouse key has been released"
  	#	@w=0
  	#	@h=0
  	end

  	def mouse_dragged
  		warn "The mouse key has been dragged"
  		#rect(mouse_x,mouse_y,@w,@h)
  		  if @shape == :rectangle
  			draw_rectangle
  		elsif @shape == :oval
  			draw_oval
  		end
  	end

  	def key_pressed
  		warn "A key was pressed! #{key.inspect}"
  		if @queue.nil?
  			@queue = ""
  		end
  		if key != "\n"
  			@queue = @queue + key
  		else
  			warn "Time to run the command : #{@queue}"
  			run_command(@queue)
  			@queue = ""
  		end
  	end

    def background_color(command)
      if command.start_with?('b') || command.start_with?('B')
        background(@f_colorNum[0].to_i,@f_colorNum[1].to_i,@f_colorNum[2].to_i)
      end
    end

    def fill_color(command)
      if command.start_with?('f') || command.start_with?('F')
        fill(@f_fillNum[0].to_i,@f_fillNum[1].to_i,@f_fillNum[2].to_i)
      end
    end

    def clear(command)
      if command.start_with?('c') ||command.start_with?('C')
        background(@f_colorNum[0].to_i,@f_colorNum[1].to_i,@f_colorNum[2].to_i)
      end
    end

    def choose_shape(command)
    #  if command.start_with?('s') && command[-1..-1] == 'r' || command[-1..-1] == 'R' || command.start_with?('S') && command[-1..-1] == 'r' || command[-1..-1] == 'R'
    #    @shape = :rectangle
    #  elsif command.start_with?('s') && command[-1..-1] == 'o' || command[-1..-1] == 'O' || command.start_with?('S') && command[-1..-1] == 'o' || command[-1..-1] == 'O'
    #    @shape= :oval
    #  end
      case @shape
      when 's1' 
        @shape = :rectangle
        @shape_number = 1
      when 's2' 
        @shape = :oval
        @shape_number = 2
      end
    end

    def size_change(command)
      if command.start_with?('+')
        if command[1..-1].to_i >= 2
          @w+=(command[1..-1].to_i)
          @h+=(command[1..-1].to_i)
        end
      elsif command.start_with?('-')
        if command[1..-1].to_i >= 2
          @w-=(command[1..-1].to_i)
          @h-=(command[1..-1].to_i)
        end
      end
    end

  	def run_command(command)
  		puts "Running Command #{command}"
        @shape_number = command[1].to_i
    		colorNum = command.slice(1,command.length-1)
    		@f_colorNum = colorNum.split(',')
    		puts @f_colorNum
        fillNum = command.slice(1,command.length-1)
        @f_fillNum = command.split(',')
        background_color(command)
        clear(command)
        choose_shape(command)
        fill_color(command)
        size_change(command)
        if command.start_with?('s') || command.start_with?('S')
          if @shape_number == 1
            @shape = :rectangle
          elsif @shape_number == 2
            @shape = :oval
          end
        end
  	end
end

ProcessArtist.new(:width => 800, :height => 800,
  :title => "ProcessArtist", :full_screen => false)
