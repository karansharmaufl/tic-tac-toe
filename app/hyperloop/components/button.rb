  class Button < Hyperloop::Router::Component
    param :on_handle_click , type: Proc
    param :value 

    def render
      DIV() do
        BUTTON(class: 'button' ) do
          params.value
            end.on(:click) do
              params.on_handle_click
        end
      end
    end
  end

