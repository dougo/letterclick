#= require test_helper

suite 'Letterclick', ->
  test 'exists in the global namespace', ->
    expect(Letterclick.Models).to.be.an 'object'

  test 'has namespaces', ->
    expect(Letterclick.Models).to.be.an 'object'
    expect(Letterclick.Collections).to.be.an 'object'
    expect(Letterclick.Views).to.be.an 'object'

  test '.start does not find a game container', ->
    expect(Letterclick.start()).to.be.undefined

  test '.start finds a game container', ->
    $('body').attr('data-game-id', '1')
    expect(Letterclick.start()).to.be.an.instanceof Letterclick.Views.GameView

  test '.start_game makes a model and view', ->
    $('body').data('game-id', 1)
    view = Letterclick.start_game($('body'))
    expect(view).to.be.an.instanceof Letterclick.Views.GameView
    expect(view.model).to.be.an.instanceof Letterclick.Models.Game
    expect(view.model.id).to.eq 1
