#= require test_helper

suite 'GameView', ->
  setup ->
    $('#konacha').html('<div id="game">')
    @game = new Letterclick.Models.Game(id: 1)
    @view = new Letterclick.Views.GameView({ model: @game })
    MockServer.respond()

  test 'fetches the Game', ->
    expect(@game.get('letters').length).to.eq 25

  test 'shows the letters in rows', ->
    rows = @view.$el.find('.row')
    expect(rows.first()).to.have.text 'ABCDE'
    expect(rows.last()).to.have.text 'UVWXY'
