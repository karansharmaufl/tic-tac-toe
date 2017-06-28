  class Board < Hyperloop::Component

    # param :my_param
    # param param_with_default: "default value"
    # param :param_with_default2, default: "default value" # alternative syntax
    # param :param_with_type, type: Hash
    # param :array_of_hashes, type: [Hash]
    # collect_other_params_as :attributes  # collects all other params into a hash

    # The following are the most common lifecycle call backs,
    # the following are the most common lifecycle call backs# delete any that you are not using.
    # call backs may also reference an instance method i.e. before_mount :my_method

    before_mount do
      # any initialization particularly of state variables goes here.
      # this will execute on server (prerendering) and client.
    end

    after_mount do
      # any client only post rendering initialization goes here.
      # i.e. start timers, HTTP requests, and low level jquery operations etc.
    end

    before_update do
      # called whenever a component will be re-rerendered
    end

    before_unmount do
      # cleanup any thing (i.e. timers) before component is destroyed
    end

    def render
      DIV do
        H1 do "Next Turn, Player: X" end
        DIV(class: 'row') do
          Button(temp: "1")
          Button(temp: "2")
          Button(temp: "3")
        end
        DIV(class: 'row') do
          Button(temp: "4")
          Button(temp: "5")
          Button(temp: "6")
        end
        DIV(class: 'row') do
          Button(temp: "7")
          Button(temp: "8")
          Button(temp: "9")
        end

      end
    end
  end

