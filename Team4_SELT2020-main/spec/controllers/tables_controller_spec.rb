require 'rails_helper'
require 'spec_helper'

describe TablesController do
  describe '#create table' do
    it 'should create a table' do
      redirect_to new_user_path
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table2')
      end
      get :index
      get :create, table:  {tablename: 'Table2'}
    end
  end
  it 'should not create a table' do
    redirect_to new_user_path
    controller.instance_eval do
      @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table2')
    end
    get :index
    get :create,{table: {tablename: "Table1"}}
    expect(response).to redirect_to new_table_path
    expect(flash[:warning]).to eq("Please try a unique table name, look through the page and see the table names and dont use them")
  end
  it 'should destroy fake table' do
    controller.instance_eval do
      @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table2')
    end
    card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table2"}
    Card.create(card)
    get :index
    get :create,{table: {tablename: "Table2"}}
    delete :destroy, id: Table.where(tablename: "Table2").first.id
  end
  it 'should show' do
    controller.instance_eval do
      @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table2')
    end
    get :index
    get :create,{table: {tablename: "Table2"}}
    get :show, id: Table.where(tablename: "Table2").first.id
  end
end
