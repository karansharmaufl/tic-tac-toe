  class Board < Hyperloop::Component

    before_mount do
      mutate.squares Array.new(9)
      mutate.next_turn TRUE
      mutate.scores Array.new(2,0)
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

    def show_score
      Score(x_score: state.scores[0].to_s, y_score: state.scores[1].to_s)
    end

    def check_score
      winner = check_winner
      mutate.squares Array.new(9) 
      mutate.next_turn TRUE
      scores = state.scores.clone
      if winner=='X'
        scores[0]=scores[0]+1
        mutate.scores scores
      elsif winner=='O'
        scores[1]=scores[1]+1
        mutate.scores scores
      end  
    end

    def render
      winner = check_winner
      message = ""     

      if winner
        message = "#{winner} Win's"
        @user=User.find(Hyperloop::Application.acting_user_id)
        if winner=='X'
        @user.update(score: @user.score+1)
        end
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
        DIV(class: 'div-mar-score') do
          show_score          
        end
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
            check_score
          end
        end
      end
    end
  end

