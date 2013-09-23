#= require test_helper

suite 'Game', ->
  setup ->
    @game = new Letterclick.Models.Game(id: 1)

  test 'can be constructed', ->
    assert.isObject @game

  test 'url is correct', ->
    assert.equal @game.url(), '/api/v1/games/1'

  test 'has a state', ->
    assert.isObject @game.get('state')

  test 'fetch also fetches the state', ->
    @game.fetch()
    MockServer.respond()
    assert.strictEqual @game.get('state').get('turn'), 2
