class Game
  require_relative 'lib/board.rb'
 

  def initialize
    #current turn starts at zero.  This is used to track which players turn it is
    @current_turn = 0
    #denotes which player is currently playing.  May allow users to choose names in future.
    @current_player = "Player One"
    #token is X or O.  Player one is always X
    @token = "X"
    #create new board object.  Board contains the 3x3 array that represents the board and various methods for affecting the board
    @board = Board.new
    #welcome message when starting the game
    puts "Welcome to Tic Tac Toe"
    puts "Enter a number between 1 and 9 to select where you want to place your mark"
    puts "Board is laid out like the number pad on your keyboard"
    puts  "---------------"
    puts  "| 7 || 8 || 9 |"
    puts  "---------------"
    puts  "| 4 || 5 || 6 |"
    puts  "---------------"
    puts  "| 1 || 2 || 3 |"
    puts  "---------------\n"
    puts "Please choose between 1-9 representing which cell you want to pick:"
    puts "Hit CTRL + C to quit\n\n"
    puts "Current player is: #{@current_player}"
    get_next_move
   
  end

  def change_turn
    #increase turn counter by one
    @current_turn +=1
    #even number turns are player one, odds are player two
    if @current_turn.even?
      #change the current player
      @current_player = "Player One"
      #change the token used to mark the board
      @token = "X"
    else
      @current_player = "Player Two"
      @token = "O"
    end
    puts "Curent Player is: #{@current_player}"
  end

  def get_next_move
    begin
    puts "Please enter your move:"
    player_choice = gets.chomp.to_i
    #if player enters anything other than a number player_choice.to_i returns a 0
    #if the player choice is a number outside of the accepted range (1..9) then an error message is shown and get_next_move is called again
    
    if player_choice.between?(1,9)
      #if the user choice is within bounds, check if they have chosen a valid cell
      #i.e. that cell is not already occupied by a previous choice
      #choice_to_coords changes the users 1..9 into an array coord i.e. 1 is [2,0], 2 is [2,1] etc
      if(@board.valid_cell?(choice_to_coords(player_choice)))
        #if the cell is valid, apply the change to the board with the current players token
        @board.apply_move(choice_to_coords(player_choice), @token)
        #print the board to show the move
        @board.print_board
        
        #check for win or draw
        if @board.game_won? 
          game_won(@current_player)
        elsif @current_turn == 8
          game_draw
        end

        change_turn
        get_next_move
      else
        #error message for if the chosen cell is not valid
        puts "That cell is already chosen"
        #call get_next_move and try again
        get_next_move
      end
    else
      #error message for a value outside of 1..9 or a letter/string etc
      puts "Invalid move entered."
      get_next_move
    end
  rescue Interrupt => e
    puts "\nExiting game - Thanks for playing!"
    exit
  end
  end

  def choice_to_coords(player_choice)
    #turns the players 1..9 choice to a coordinate that we can check on our board
    case player_choice
    when 1
      [2,0]
    when 2
      [2,1]
    when 3
      [2,2]
    when 4
      [1,0]
    when 5
      [1,1]
    when 6
      [1,2]
    when 7
      [0,0]
    when 8
      [0,1]
    when 9
      [0,2]
    end
  end

  def game_won(current_player)
    puts "#{current_player} won the game!"
    exit
  end

  def game_draw
    puts "This game was a draw!"
    exit
  end

end

Game.new





