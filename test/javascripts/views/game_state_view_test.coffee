#= require test_helper

suite 'GameStateView', ->
  setup ->
    $('#konacha').html('<div id="game">')
    state = new Letterclick.Models.Game(id: 1).get('state')
    @view = new Letterclick.Views.GameStateView(model: state)
    MockServer.respond()

  test 'fetches the GameState', ->
    expect(@view.model.get('turn')).to.eq 2
    expect(@view.model.get('squares').length).to.eq 4
