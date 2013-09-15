#= require test_helper

suite 'GameState', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @state = new Letterclick.Models.GameState(game: game)

  test 'belongs to a game', ->
    expect(@state.get('game')).to.be.an 'object'

  test 'url is correct', ->
    expect(@state.url()).to.eq @state.get('game').url() + '/state'
