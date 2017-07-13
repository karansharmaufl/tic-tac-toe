
  class Highscore < Hyperloop::Router::Component
    def render
      @users=User.by_score.all
      div do
        h1 do NavLink('/main/app',  active_style: { display: :none }) { 'BackToGame' } end
        h2(class: 'h1') do "Highscore Page" end
        @users.each do |u|
        if u.id==Hyperloop::Application.acting_user_id
            h1 do "User Email:#{u.email} User Score:#{u.score}" end
        else
            h4(class: 'h3') do "User Email:#{u.email} User Score:#{u.score}" end
        end
        end
      end
    end
  end

