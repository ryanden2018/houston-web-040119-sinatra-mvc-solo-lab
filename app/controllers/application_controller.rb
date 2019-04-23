class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
        set :method_override, true
      end
    
      get '/' do
        erb :welcome
        redirect '/puppy'
      end

   
end
