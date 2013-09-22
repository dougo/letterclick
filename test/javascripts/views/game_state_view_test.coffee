#= require test_helper

suite 'GameStateView', ->
  setup ->
    game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView(model: game).state_view
    MockServer.respond()

  test 'has a game_view', ->
    expect(@view.game_view).to.be.an 'object'

  test 'fetches the GameState', ->
    expect(@view.model.get('turn')).to.eq 2
    expect(@view.model.get('squares').length).to.eq 25

  test 'colors squares by owner', ->
    expect(@view.$('.letter').length).to.eq 25
    W = @view.$('.letter:contains("W")')
    G = @view.$('.letter:contains("G")')
    B = @view.$('.letter:contains("B")')

    expect(W).to.have.class('player1')
    expect(W).not.to.have.class('player2')

    expect(G).not.to.have.class('player1')
    expect(G).to.have.class('player2')

    expect(B).not.to.have.class('player1')
    expect(B).not.to.have.class('player2')
