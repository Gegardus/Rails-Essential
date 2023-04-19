class MainController < ApplicationController
  def index
    # render('index')
    # render('hello')
  end

  def about
    # render('about')
    @created_by = 'Vahan'
    @id = params['id']
    @page = params[:page]
  end

  def hello
    redirect_to(action: 'index')
  end
end
