require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe '#create_user' do
    it 'should redirect to Cards path' do
      get :new
      x =User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table1')
      redirect_to new_session_path
      redirect_to tables_path
      redirect_to cards_path
      redirect_to cards_draw_card_path
      expect(response).to be_successful
    end

    it 'should create User' do
      params=Hash.new
      params['user'] ={'name'=>'Evan','password_digest'=>'aaaa', tablename: 'Table1'}
      get :create, params
    end
    it 'should reject not unique users' do
      params=Hash.new
      params['user'] ={'name'=>'Evan','password_digest'=>'aaaa', tablename: 'Table1'}
      get :create, params
      get :create, params
      expect(response).to redirect_to new_user_path
    end
    it 'should redirect to Cards path' do
      get :new
      x =User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: 'Table1')
      redirect_to new_session_path
      redirect_to tables_path
      redirect_to cards_path
      redirect_to cards_draw_card_path
      redirect_to cards_pass_card_path
      expect(response).to be_successful
    end
    it 'should raise error' do
      get :new
      x =User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      redirect_to new_session_path
      redirect_to tables_path
      expect{Table.create!(tablename: 'Table1')}.to raise_error
    end
    it 'should show' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      redirect_to tables_path
      get :show, id: (User.where('name' => 'Evan').first.id)
      expect(response).to render_template (:show)
    end
    it 'should update' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      redirect_to tables_path
      get :update, id: (User.where('name' => 'Evan').first.id), user: {tablename: "Table5"}
      expect(User.where(name: 'Evan').first.tablename).to include 'Table5'
    end
    it 'should edit' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      redirect_to tables_path
      get :edit, id: (User.where('name' => 'Evan').first.id)
      expect(response).to render_template (:edit)
    end
  end
  describe '#assign_current_user_table' do
    it 'should assign current user table' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      redirect_to tables_path
      get :assign_current_user_table
      expect(response).to redirect_to tables_path
    end
  end
end