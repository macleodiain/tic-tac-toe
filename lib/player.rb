class Player
  #number of player objects created.  Used later to make sure player one is assigned X and player two is assigned O
@@NUMBER_OF_PLAYERS = 0
#accessor methods for name and token
attr_accessor :player_name, :player_token, :player_color
  def initialize
    #get the player name
    @player_name = gets.chomp
    #sets player token to X as default
    @player_token = "X"
    #if number of player is > 0 (i.e this is the second player being created) then set token to O
    @player_token = "O" if @@NUMBER_OF_PLAYERS > 0
    #update number of player objects created
    @player_color = :blue
    @player_color = :red if @@NUMBER_OF_PLAYERS > 0
    @@NUMBER_OF_PLAYERS +=1
  end
end
