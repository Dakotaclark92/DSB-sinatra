class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :home
  end
  
end
