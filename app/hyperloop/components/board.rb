  class Board < Hyperloop::Component

    #param :message_turn type: String
    before_mount do
      mutate.squares Array.new(9)
      mutate.next_turn TRUE
      #@user = current_user
    end

    def make_cell(i)
      Button(value: state.squares[i]).on(:handle_click)do
        click_event(i)
      end
    end

    def click_event(i)
      squares = state.squares.clone  
      if !check_winner and !state.squares[i]
        if state.next_turn
          squares[i] = 'X'
          mutate.next_turn !state.next_turn
        else
          squares[i] = 'O'
          mutate.next_turn !state.next_turn
        end
      end
      mutate.squares squares
    end

    def wins
     [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
     ]
    end

    def check_winner
      winner = nil
      wins.each do |win|
        a=win[0]
        b=win[1]
        c=win[2]
        if state.squares[a] and state.squares[a]==state.squares[b] and state.squares[a]==state.squares[c]
          winner = state.squares[a]
        end
      end
      return winner   
    end
    
    def full
      state.squares.all? {|i| !i.nil? }
    end
  
    def draw
      draw = false
      winner = check_winner
      if !winner and full
        draw = true
      end
      return draw
    end

    def render
      winner = check_winner
      message = ""     

      if winner
        message = "#{winner} Win's"
        @user=current_user
        @user.update(score: 10)
      else
        if state.next_turn 
          message = "X's Turn"
        else
          message = "O's Turn"  
        end
        if draw
          message = "XO - Tie"
        end
      end
      DIV(class: 'div-mar-left') do
        H1(class: 'h1') do "#{ message }" end
        DIV(class: 'container') do
          DIV(class: 'row div-mar-adj') do
            make_cell(0)
            make_cell(1)
            make_cell(2)
          end
          DIV(class: 'row') do
            make_cell(3)
            make_cell(4)
            make_cell(5)
          end
          DIV(class: 'row') do
            make_cell(6)
            make_cell(7)
            make_cell(8)
          end
        end
        DIV(class: 'div-btn') do
          BUTTON(class: 'btn-circle') do
            "NEW GAME"
          end.on(:click) do
            mutate.squares Array.new(9)
            mutate.next_turn TRUE
          end
        end
      end
    end
  end

