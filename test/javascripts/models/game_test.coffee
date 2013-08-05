#= require test_helper

suite 'Game', ->
  setup ->
    @game = new Letterclick.Models.Game(id: 1)

  test 'can be constructed', ->
    expect(@game).to.be.an 'object'

  test 'url is correct', ->
    expect(@game.url()).to.eq '/api/v1/games/1'
