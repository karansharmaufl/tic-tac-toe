
  class Helloworld < Hyperloop::Component

    def render
      div do
        h1(class: 'tic-tac') do "Tic-Tac-Toe" end
        BUTTON do "Click me" end.on(:click) do
          Welcome()
          end
      end
    end
  end

