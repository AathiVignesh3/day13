class HomeController < ApplicationController


def index
    respond_to do |format|
        format.html
        format.js   { render "tasks/task", :layout => false }
    end
end 

end