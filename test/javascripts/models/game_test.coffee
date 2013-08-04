#= require test_helper

suite 'Game', ->
  test 'can be constructed', ->
    model = new Letterclick.Models.Game()
    expect(model).to.be.an('object')
    expect(model.it_works()).to.eq('It works!')
