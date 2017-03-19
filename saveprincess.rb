class SavePrincess
 GRID_SIZE_LOWER_LIMIT = 3
 GRID_SIZE_UPPER_LIMIT = 100
 BOT_IDENTIFIER = 'm'
 PRINCE_IDENTIFIER = 'p'

 class << self
   def start_rescue
     puts "Enter a grid size" #best place to put the message is localization but here I am not using RAILS framework
     size_info = gets.chomp
     grid_size = size_info.to_i
     if grid_size >= GRID_SIZE_LOWER_LIMIT and grid_size < GRID_SIZE_UPPER_LIMIT 
       puts "You entered the grid size #{grid_size}"
       grid = get_grid_element(grid_size)
       display_path_to_princess(grid_size, grid)
     else
       puts "You entered the grid size #{size_info}. Please make sure grid size between #{GRID_SIZE_LOWER_LIMIT} and #{GRID_SIZE_UPPER_LIMIT}"
     end  
   end  
   
   def get_grid_element(grid_size)
     grid = Array.new(grid_size)
     grid_row_count = grid_size - 1
     0.upto grid_row_count do |row|  
       puts "please start to enter grid element for row #{row + 1}"
       grid_col = []
       0.upto grid_row_count do |col|
         grid_col << gets.chomp
       end
       puts " You entered the first row #{grid_col.inspect}"
       grid[row] = grid_col
     end
     puts "You have eneterd the grid #{grid.inspect}"
     grid
   end
   
   def display_path_to_princess(grid_size, grid)
    bot_row = grid.detect{ |grid_row| grid_row.include?(BOT_IDENTIFIER) }
    if bot_row
      bot_position = [grid.index(bot_row), bot_row.index(BOT_IDENTIFIER)]
      puts "Good News!! I found the bot position at #{bot_position.inspect} and now the mission start to find the location for Princess"
      princess_row = grid.detect{ |grid_row| grid_row.include?(PRINCE_IDENTIFIER) }
      if princess_row
        princess_position = [grid.index(princess_row), princess_row.index(PRINCE_IDENTIFIER)]
        puts "Yes, I also locate prince position at #{princess_position.inspect} and now the job to find the shorest path"
        get_shortest_path(bot_position, princess_position)
      else
        puts 'Yeah.. I found it without much effort. Princess does not exist in this universe.'    
      end
    else
      puts "\nOHH.. You want me to find the princess but where is my BOT??"
    end
   end
   
   def get_shortest_path(bot_position, princess_position)
      rows_difference = princess_position[0] - bot_position[0]
      cols_difference = princess_position[1] - bot_position[1]
      puts '----------------------------------------------'
      move_top_bottom = rows_difference < 0 ? "UP \n" * rows_difference.abs : "DOWN \n" * rows_difference.abs 
      move_left_right = cols_difference < 0 ? "LEFT \n" * cols_difference.abs : "RIGHT \n" * cols_difference.abs
      puts "#{move_top_bottom}"
      puts "#{move_left_right}"
      puts '----------------------------------------------'
   end
 end      
end

SavePrincess.start_rescue
 
 
