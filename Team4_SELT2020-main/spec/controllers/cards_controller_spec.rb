require 'rails_helper'
require 'spec_helper'
describe CardsController do
  describe '#create' do
    it 'should create more stuff' do
      Table.create(tablename: "Table1")
      card = { name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1"}
      Card.create(card)
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      get :create,commit: "Table1"
      expect(response).to redirect_to tables_path
    end
    it 'should not create' do
      Table.create(tablename: "Table1")
      card = { name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "notThere"}
      Card.create(card)
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      expect{get :create,commit: "Table1"}.to raise_error("Something is wrong with the db")
    end
  end
  describe "#show" do
    it 'should take alternative path due to name not being discard_cards' do
      expect{get :show, id: 1}.to raise_error()
    end
    it 'should test show paths1' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      get :show, id: "discard_cards"
      expect(response).to render_template (:discard_cards)
    end
    it 'should test show paths2' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      Card.create(name: "BJ", location: "Player1", status: 0, cardFront: "&#127183", tablename: "Table1")
      get :show, id: "remove_cards"
      expect(response).to render_template (:remove_cards)
    end
  end
  describe '#take_from_board', type: :feature do
    it 'should take from board'do
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "Evan", status: 4, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :take_from_board, commit: "&#127153"
      expect(flash[:warning]).to eq("Card taken by Evan")
    end
  end
  describe "play_card", type: :feature do
    it 'should play a card' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      card = { name: "AH", location: "Evan", status: 2, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :play_card, commit: "&#127153".html_safe
      expect(flash[:notice]).to eq("Card played")
      expect(flash[:warning]).not_to eq("Card not played")
      expect(Card.where(name: "AH").first.status).to eq 3
    end
    it 'should not play a card' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      card = { name: "AH", location: "Evan", status: 4, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :play_card, commit: "&#127153".html_safe
      expect(flash[:warning]).to eq("Card not played")
      expect(flash[:notice]).not_to eq("Card played")
      expect(Card.where(name: "AH").first.status).to eq 4
    end
  end
  describe '#reset_card', type: :feature do
    it 'should reset the cards path' do
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table2")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table2"}
      Card.create(card)
      get :index
      post :select_card, card_select: 'AH'
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(Card.where(name: "AH").first.location).to include "Evan"
      post :reset_card
      expect(Card.where(name: "AH").first.status).to eq 1
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
    end
    it 'should reset the cards path with Jokers' do
      card = { name: "BJ", location: "deck", status: 1, cardFront: "&#127183", tablename: "Table2"}
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table2")
      end
      Card.create(card)
      get :index
      post :select_card, card_select: 'BJ'
      expect(Card.where(name: "BJ").first.status).to eq 2
      expect(Card.where(name: "BJ").first.location).to include "Evan"
      post :reset_card
      expect(Card.where(name: "BJ").first.status).to eq 0
      expect(Card.where(name: "BJ").first.location).not_to include "Evan"

    end
  end
  describe '#recover_discard', type: :feature do
    it 'should recover discard' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "Zaboomafu", status: 4, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      post :discard_card, move: {movement: "Me"},commit: 'a'
      post :draw_card, commit: "Draw"
      expect(flash[:warning]).to eq("decks empty")
      expect(Card.where(name:"AH").first.status).to eq 5
      expect(Card.where(name:"AH").first.location).to include "Evan"
      post :recover_discard
      expect(response).to redirect_to cards_path
      post :draw_card, commit: "Draw"
      expect(flash[:notice]).to eq("Card added to Evan")
      expect(Card.where(name:"AH").first.status).to eq 2
      expect(Card.where(name:"AH").first.location).to include "Evan"
    end
  end
  describe '#recard_card', type: :feature do
    it 'should move from board to action' do
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "Evan", status: 4, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :recard_card, move: {movement: 'Board to Action'}
      expect(flash[:warning]).not_to eq("No recard happened")
      post :recard_card, move: {movement: 'Action to Hand'}
      expect(flash[:warning]).not_to eq("No recard happened")
      post :recard_card, move: {movement: 'Hand to Assigned Deck'}
      expect(flash[:warning]).not_to eq("No recard happened")
    end
    it 'should warn you if you arent recarding' do
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "Evan", status: 4, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :recard_card, move: {movement: 'Action to Hand'}
      expect(flash[:warning]).to eq("No recard happened")
      post :recard_card, move: {movement: 'Hand to Assigned Deck'}
      expect(flash[:warning]).to eq("No recard happened")
    end
  end
  describe '#discard_card', type: :feature do
    it 'should discard p1' do
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      Table.create(tablename: "Table1")
      get :index
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 1
      post :select_card, {card_select: 'AH'}
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      2.times do
        post :play_card, commit: "&#127153".html_safe
      end
      expect(Card.where(name: "AH").first.status).to eq 4
      expect(flash[:notice]).to eq("Card played")
      post :discard_card, move: {movement: "Unassigned"},commit: 'a'
      expect(Card.where(name: "AH").first.location).to include "GameDeck"
      expect(Card.where(name: "AH").first.status).to eq 5
      expect(flash[:warning]).to eq("Discarded to Unassigned")
      post :take_from_board, commit: "&#127153"
      expect(flash[:warning]).to eq("No Card Found")
      expect(Card.where(name: "AH").first.status).to eq 5
    end
    it 'should discard action' do
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      Table.create(tablename: "Table1")
      get :index
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 1
      post :select_card, {card_select: 'AH'}
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      post :play_card, commit: "&#127153".html_safe
      expect(Card.where(name: "AH").first.status).to eq 3
      expect(flash[:notice]).to eq("Card played")
      post :discard_card, move: {movement: "Unassigned"},commit: 'b'
      expect(flash[:warning]).to eq("Discarded Action to Unassigned")
      expect(Card.where(name: "AH").first.location).to include "GameDeck"
      expect(Card.where(name: "AH").first.status).to eq 5
    end
    it 'should discard action to me' do
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      Table.create(tablename: "Table1")
      get :index
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 1
      post :select_card, {card_select: 'AH'}
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      post :play_card, commit: "&#127153".html_safe
      expect(Card.where(name: "AH").first.status).to eq 3
      expect(flash[:notice]).to eq("Card played")
      post :discard_card, move: {movement: "Me"},commit: 'b'
      expect(flash[:warning]).to eq("Discarded Action to Me")
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 5
    end
    it 'should discard board' do
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      Table.create(tablename: "Table1")
      get :index
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 1
      post :select_card, {card_select: 'AH'}
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      2.times do
        post :play_card, commit: "&#127153".html_safe
      end
      expect(Card.where(name: "AH").first.status).to eq 4
      expect(flash[:notice]).to eq("Card played")
      post :discard_card, move: {movement: "Unassigned"},commit: 'a'
      expect(flash[:warning]).to eq("Discarded to Unassigned")
      expect(Card.where(name: "AH").first.location).to include "GameDeck"
      expect(Card.where(name: "AH").first.status).to eq 5
    end
    it 'should discard board Assigned' do
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      Table.create(tablename: "Table1")
      get :index
      expect(Card.where(name: "AH").first.location).not_to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 1
      post :select_card, {card_select: 'AH'}
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      2.times do
        post :play_card, commit: "&#127153".html_safe
      end
      expect(Card.where(name: "AH").first.status).to eq 4
      expect(flash[:notice]).to eq("Card played")
      post :discard_card, move: {movement: "Me"},commit: 'a'
      expect(flash[:warning]).to eq("Discarded to Me")
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 5
    end
  end
  describe '#pass_card', type: :feature do
    it 'should pass the card' do
      User.create('name'=>'Evan1', 'password_digest' => 'aaaa1', tablename: "Table1")
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :select_card, {card_select: 'AH'}
      post :play_card, commit: "&#127153".html_safe
      post :pass_card, to: "Evan1"
      expect(Card.where(name: "AH").first.location).to include "Evan1"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:warning]).to eq("Card(s) passed")
    end
    it 'shouldnt pass no content' do
      User.create('name'=>'Evan1', 'password_digest' => 'aaaa1', tablename: "Table1")
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      card = { name: "AH", location: "deck", status: 1, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :index
      post :select_card, {card_select: 'AH'}
      post :pass_card, to: "Evan1"
      expect(Card.where(name: "AH").first.location).not_to include "Evan1"
      expect(Card.where(name: "AH").first.location).to include "Evan"
      expect(Card.where(name: "AH").first.status).to eq 2
      expect(flash[:warning]).to eq("Card(s) not passed")
    end
  end
  describe "#draw_card", type: :feature do
    it 'should not raise an error' do
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table2')
      end
      card = { name: "AH", location: "Evan", status: 1, cardFront: "&#127153", tablename: "Table2"}
      Card.create(card)
      get :index
      post :draw_card, commit: "Draw"
      expect(Card.where(name: "AH").first.status).to eq 2
    end
    it 'should draw a card from Current User Deck' do
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table2')
      end
      card = { name: "AH", location: "Evan", status: 1, cardFront: "&#127153", tablename: "Table2"}
      Card.create(card)
      get :index
      get :draw_card, commit: "Draw"
      expect(Card.where(status:2).first.location).to eq("Evan")
      post :recard_card, move: {movement: 'Hand to Assigned Deck'}
      expect(Card.where(status:2).first).to be_nil
      get :draw_card, commit: "Draw"
      expect(Card.where(location: "Evan").first.status).to eq(2)
      post :play_card, commit: "&#127153"
      post :discard_card, move: {movement: "Unassigned"},commit: 'b'
      expect(flash[:warning]).to eq("Discarded Action to Unassigned")
      post :recover_discard
      expect(Card.where(name: "AH").first.location).to include "GameDeck"
      expect(Card.where(name: "AH").first.status).to be 1
      post :draw_card, commit: "Draw"
      expect(Card.where(name: "AH").first.location).to include ("Evan")
      expect(Card.where(name: "AH").first.status).to be 2
    end
    it 'should draw for the dealer' do
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table2')
      end
      card = { name: "AH", location: "GameDeck", status: 1, cardFront: "&#127153", tablename: "Table2"}
      Card.create(card)
      get :index
      get :draw_card, commit: "Deal"
      expect(Card.where(name: "AH").first.location).to include ("Dealer")
      expect(Card.where(name: "AH").first.status).to eq 4
    end
    it 'tell you if decks empty' do
      Table.create!(tablename: "Table2")
      controller.instance_eval do
        @current_user = User.create!('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table2')
      end
      get :index
      get :draw_card, commit: "Deal"
      expect(flash[:warning]).to include("decks empty")
    end
  end
  describe '#select_cards', type: :feature do
    it 'should select a card and add it to the user stack' do
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      Card.create( name: "AH", location: "GameDeck", status: 1, cardFront: "&#127153", tablename: "Table1")
      x= Card.all
      get :index
      post :select_card, card_select: 'AH'
      expect(flash[:notice]).to eq("Selected card placed in user hand")
      expect(Card.where(name: "AH").first.location).to include("Evan")
    end
  end
  describe '#discard_cards', type: :feature do
    it 'should display the discard page' do
      get :discard_cards
      expect(response).to render_template "cards/discard_cards"
    end
    it 'shouldnt work for wrong path' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      card = { name: "AH", location: "Evan", status: 2, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :show, id: "discard_cards"
      get :cards_to_discard, {checkbox: nil}
      expect(Card.where(name:"AH").first.status).not_to eq 5
      expect(flash[:warning]).to include("No cards selected")
    end
    it 'should discard proper card' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      card = { name: "AH", location: "Evan", status: 2, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :show, id: "discard_cards"
      get :cards_to_discard, {checkbox: {(Card.where(name: "AH").first.id) => 1}}
      expect(Card.where(name:"AH").first.status).to eq 5
    end

  end
  describe '#remove_cards', type: :feature do
    it 'should display the remove cards page' do
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      Card.create( name: "AH", location: "Evan", status: 1, cardFront: "&#127153", tablename: "Table1")
      x= Card.all
      get :index
      get :cards_to_remove, {checkbox: {"#{x.first.id}": 1}}
           expect(Card.where(name: "AH").first.location).to eq('Out of Play')
    end
    it 'should moved selected cards to status 0' do
       Table.create(tablename:"Table1")
       controller.instance_eval do
         @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
       end
       Card.create( name: "AH", location: "Evan", status: 1, cardFront: "&#127153", tablename: "Table1")
       x= Card.all
       get :index
       get :cards_to_remove, {checkbox: {"#{x.first.id}": 1}}
       expect(Card.where(name: "AH").first.status).to eq 0
    end
    it 'shouldnt work for wrong path1' do
      Table.create(tablename: "Table1")
      controller.instance_eval do
        @current_user =User.create('name'=>'Evan', 'password_digest' => 'aaaa', 'tablename' => 'Table1')
      end
      card = { name: "AH", location: "Evan", status: 2, cardFront: "&#127153", tablename: "Table1"}
      Card.create(card)
      get :show, id: "discard_cards"
      get :cards_to_remove, {checkbox: nil}
      expect(Card.where(name:"AH").first.status).not_to eq 5
      expect(flash[:warning]).to include("No cards selected")
    end
  end
  describe '#leave_game', type: :feature do
    it 'should leave game'do
      Table.create(tablename:"Table1")
      controller.instance_eval do
        @current_user = User.create('name'=>'Evan', 'password_digest' => 'aaaa', tablename: "Table1")
      end
      Card.create( name: "AH", location: "Evan", status: 1, cardFront: "&#127153", tablename: "Table1")
      x= Card.all
      get :index
      post :leave_game
      expect(response).to redirect_to root_path
    end
  end

end

