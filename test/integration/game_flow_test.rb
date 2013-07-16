require 'test_helper'

class GameFlowTest < ActionDispatch::IntegrationTest
  test 'make some moves' do
    post '/games.json'
    assert_response :success, json_resp
    game = json_resp
    
    get "/games/#{game['id']}/state.json"
    assert_response :success, json_resp
    state1 = json_resp
    squares = [0]*25
    assert_equal squares, state1['squares']

    indices = [9,0,1,2,5]
    post "/games/#{game['id']}/moves.json", move: { indices: indices }
    assert_response :success, json_resp
    move = json_resp
    word = indices.map { |i| game['letters'][i] }.join
    assert_equal word, move['word']

    get "/games/#{game['id']}/state.json"
    assert_response :success, json_resp
    state2 = json_resp
    assert_equal state1['turn'] + 1, state2['turn']
    squares = [1, 1, 1, 0, 0,
               1, 0, 0, 0, 1,
               0, 0, 0, 0, 0,
               0, 0, 0, 0, 0,
               0, 0, 0, 0, 0]
    assert_equal squares, state2['squares']
  end
end
