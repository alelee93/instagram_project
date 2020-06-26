class ApplicationController < Sinatra::Base
    set :views, -> {File.join(root, '../views')}
    #set :method_override, true
    configure do
       # set :views, "app/views"
        enable :sessions
        set :session_secret, "password_security"
    end

    get "/" do
        if logged_in?
            erb :home
        else
            redirect "/signup"
        end
    end

    get "/login" do
        erb :login
    end 

    post "/login" do
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/feed"
        else
            redirect "/signup"
        end
    end 

    get "/signup" do
        erb :signup
    end

    post "/signup" do
        user = User.new(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
        if user.save
            redirect "/login"
        else
            redirect "/failure"
        end
    end

    get "/logout" do
        session.clear
        redirect "/"
    end

    get "/failure" do
        erb :failure
    end

    get "/feed" do
        if logged_in?
            erb :feed
        else
            redirect "/login"
        end
    end


    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
    end
    

end