require 'test_helper'

class GameFlowTest < ActionDispatch::IntegrationTest
  test 'make some moves' do
    post '/games.json'
    assert_response :success, json_resp
    game = json_resp
    
    get "/games/#{game['id']}/state.json"
    assert_response :success, json_resp
    squares = [0]*25
    assert_equal squares, json_resp['squares']

    indices = [9,0,1,2,5]
    post "/games/#{game['id']}/moves.json", move: { indices: indices }
    assert_response :success, json_resp
    move = json_resp
    word = indices.map { |i| game['letters'][i] }.join
    assert_equal word, move['word']

    # TODO:
    # indices.each { |i| squares[i] = 1 }
    get "/games/#{game['id']}/state.json"
    assert_response :success, json_resp
    assert_equal squares, json_resp['squares']
  end
end
