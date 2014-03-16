require 'test_helper'

class APIBrowseTest < ActionDispatch::IntegrationTest
  test "browse games, states, and moves" do
    game1 = FactoryGirl.create(:game, letters: "QWERTYUIOPASDFGHJKLZXCVBM")
    state1 = game1.state
    move1 = FactoryGirl.create(:move, game: game1, turn: 1, seat: 1, indices: [1, 8, 3, 12])
    state2 = game1.state
    move2 = FactoryGirl.create(:move, game: game1, turn: 2, seat: 2, indices: [14, 10, 24, 2])
    state3 = game1.state

    game2 = FactoryGirl.create(:game, letters: "ZYXWVUTSRQPONMLKJIHGFEDCB")

    get "/api/v1/games"
    assert_response :success, json_resp
    expected = [
      {
        id: game1.id,
        letters: "QWERTYUIOPASDFGHJKLZXCVBM",
        created_at: game1.created_at.iso8601(3),
        updated_at: game1.created_at.iso8601(3)
      },
      {
        id: game2.id,
        letters: "ZYXWVUTSRQPONMLKJIHGFEDCB",
        created_at: game2.created_at.iso8601(3),
        updated_at: game2.created_at.iso8601(3)
      }
    ]
    assert_equal expected, json_resp

    get "/api/v1/games/#{game1.id}/states"
    assert_response :success, json_resp
    expected = [
      {
        id: state1.id,
        game_id: game1.id,
        created_at: state1.created_at.iso8601(3),
        updated_at: state1.created_at.iso8601(3),
        turn: 1,
        squares: [0]*25
      },
      {
        id: state2.id,
        game_id: game1.id,
        created_at: state2.created_at.iso8601(3),
        updated_at: state2.created_at.iso8601(3),
        turn: 2,
        squares: [
          0, 1, 0, 1, 0,
          0, 0, 0, 1, 0,
          0, 0, 1, 0, 0,
          0, 0, 0, 0, 0,
          0, 0, 0, 0, 0
        ]
      },
      {
        id: state3.id,
        created_at: state3.created_at.iso8601(3),
        updated_at: state3.created_at.iso8601(3),
        game_id: game1.id,
        turn: 3,
        squares: [
          0, 1, 2, 1, 0,
          0, 0, 0, 1, 0,
          2, 0, 1, 0, 2,
          0, 0, 0, 0, 0,
          0, 0, 0, 0, 2
        ]
      }
    ]
    assert_equal expected, json_resp

    get "/api/v1/games/#{game1.id}/moves"
    assert_response :success, json_resp
    expected = [
      {
        id: move1.id,
        game_id: game1.id,
        indices: [1, 8, 3, 12],
        created_at: move1.created_at.iso8601(3),
        updated_at: move1.created_at.iso8601(3),
        turn: 1,
        seat: 1,
        word: "WORD"
      },
      {
        id: move2.id,
        game_id: game1.id,
        indices: [14, 10, 24, 2],
        created_at: move2.created_at.iso8601(3),
        updated_at: move2.created_at.iso8601(3),
        turn: 2,
        seat: 2,
        word: "GAME"
      }
    ]
    assert_equal expected, json_resp
  end
end
