
  class Highscore < Hyperloop::Component

    def render
      @users=User.all
      div do
        @users.each do |u|
        h5 do "User Email:#{u.email} User Score:#{u.score}" end
        end
      end
    end
  end

