#= require test_helper

suite 'Letterclick', ->
  test 'exists in the global namespace', ->
    expect(Letterclick.Models).to.be.an 'object'

  test 'has namespaces', ->
    expect(Letterclick.Models).to.be.an 'object'
    expect(Letterclick.Collections).to.be.an 'object'
    expect(Letterclick.Views).to.be.an 'object'

  test '.start makes a model and view', ->
    view = Letterclick.start(1)
    expect(view).to.be.an.instanceof Letterclick.Views.GameView
    expect(view.model).to.be.an.instanceof Letterclick.Models.Game
    expect(view.model.id).to.eq 1
