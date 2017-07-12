class App < Hyperloop::Router
  # now you specify how the router keeps track of the url, :browser means use standard HTML5 browser history
  history :browser
  # the normal render method is replaced by the route method
  route do
    DIV do  # the route method will work like a normal render
        h1 do NavLink('/welcome/highscore',  active_style: { display: :none }) { 'HighScore' } end
        Route('/main/app', exact: true, mounts: Board)
        Route('/welcome/highscore', mounts: Highscore )
    end
  end
end