#= require test_helper

suite 'GameState', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @state = new Letterclick.Models.GameState(game: game)

  test 'belongs to a game', ->
    assert.isObject @state.get('game')

  test 'url is correct', ->
    assert.equal @state.url(), @state.get('game').url() + '/state'
