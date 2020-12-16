class TablesController < ApplicationController
  def home
  end
  def table_params
    params.require(:table).permit(:tablename)
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    @table = Table.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  def create
    x = table_params
    if Table.where(tablename: x.values.first).exists?
      flash[:warning]="Please try a unique table name, look through the page and see the table names and dont use them"
      redirect_to new_table_path
    else
      @table=Table.create!(table_params)
      @user = User.where(name: @current_user.name).first
      @user.update(tablename: x["tablename"])
      @current_user.update(tablename: x["tablename"])
      redirect_to new_card_path(request.parameters)
    end
  end
  def destroy
    @table = Table.find(params[:id])
    t1 = @table.tablename
    @table.destroy
    @cards = Card.where(tablename:t1)
    @cards.each do |card|
      card.destroy
    end
    redirect_to tables_path
  end
  def index
    @tables = Table.all
  end

  def new
    # default: render 'new' template
  end
end