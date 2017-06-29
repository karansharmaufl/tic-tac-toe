  class Board < Hyperloop::Component
    before_mount do
      mutate.squares Array.new(9)
    end

    def make_cell(i)
      Button(value: state.squares[i]).on(:on_handle_click)do
      puts "*****Clicked****"
        click_event(i)
      end
    end

    def click_event(i)
      squares = state.squares.clone
      squares[i] = 'X'
      mutate.squares squares
    end

    def render
      DIV do
        H1 do "Next Turn, Player: X" end
        DIV(class: 'row') do
          make_cell(1)
          make_cell(2)
          make_cell(3)
        end
        DIV(class: 'row') do
          make_cell(4)
          make_cell(5)
          make_cell(6)
        end
        DIV(class: 'row') do
          make_cell(7)
          make_cell(8)
          make_cell(9)
        end

      end
    end
  end

