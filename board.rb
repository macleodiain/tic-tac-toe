class Board
 
  def initialize
    #create a 3x3 array, set - as the default value.  This represents an empty cell.
    @board = Array.new(3){ Array.new(3, "-")}
   
  end

  def print_board
    #loops through rows and cells printing out each one with some formatting
    print "-------------\n"
    @board.each do |row|
      row.each do |cell|
        print "| #{cell} "
      end
      print "|"
      print "\n"
      print "-------------\n"
    end
  end

  def valid_cell?(move)
    #returns true if the cell is empty
    true if @board[move[0]][move[1]] == "-"
  end

  def apply_move(move, token)
    #sets the chosen cell to the current players token
    @board[move[0]][move[1]] = token
  end

  def game_won?
    columns = [[],[],[]]
   
    @board.each do |row|
      #checks every row for win
      if row.all?{|cell| cell == "X"} || row.all?{|cell| cell == "O"}
        return true 
      end
    end
      #loop through the board and get the columns
      @board.each do |row|
        row.each_with_index do |cell, index|
          columns[index] << cell 
        end
      end
      #checks the array of columns for a win
      columns.each do |column|
        if column.all?{|cell| cell == "X"} || column.all?{|cell| cell == "O"}
          return true
        end
      end

      diagonals = [[],[]]
      #loop through and get top left to bottom right diagonal
      @board.each_with_index do |row, index|
        diagonals[0]<< row[index]
      end
      # used reverse here so the same code above applies
      @board.each_with_index do |row, index|
        diagonals[1] << row.reverse[index]
      end
      #check diagonals for a win
      diagonals.each do |diagonal|
        if diagonal.all?{|cell| cell == "X"} || diagonal.all?{|cell| cell == "O"}
          return true
        end
      end

       
    return false
  end

end



