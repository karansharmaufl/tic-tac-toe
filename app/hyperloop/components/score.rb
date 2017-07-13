class Score < Hyperloop::Router::Component
    param :x_score
    param :y_score
    def render
      div do
        H2 do "X-Score: #{params.x_score}" end
        H2 do "O-Score: #{params.y_score}" end
      end
    end
  end

