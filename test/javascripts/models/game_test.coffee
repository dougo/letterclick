#= require test_helper

suite 'Game', ->
  setup ->
    @game = new Letterclick.Models.Game(id: 1)

  test 'can be constructed', ->
    assert.instanceOf Letterclick.Models.Game, @game

  test 'url is correct', ->
    assert.equal '/api/v1/games/1', @game.url()

  test 'has a state', ->
    assert.instanceOf Letterclick.Models.GameState, @game.get('state')

  test 'fetch also fetches the state', ->
    @game.fetch()
    MockServer.respond()
    assert.equal 2, @game.get('state').get('turn')
