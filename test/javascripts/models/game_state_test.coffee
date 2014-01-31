#= require test_helper

suite 'GameState', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @state = new Letterclick.Models.GameState(game: game)

  test 'belongs to a game', ->
    assert.instanceOf Letterclick.Models.Game, @state.get('game')

  test 'url is correct', ->
    assert.equal @state.get('game').url() + '/state', @state.url()
