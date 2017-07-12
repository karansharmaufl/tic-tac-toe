  class Welcomepage < Hyperloop::Component
    def render
      div do
        h1(class: 'tic-tac') do "Tic-Tac-Toe" end
      end
    end
  end

