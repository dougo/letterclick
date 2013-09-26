class Letterclick.Views.GameView extends Backbone.View
  initialize: ->
    state = @model.get('state')
    # TODO: make board and word views (and models)
    @state_view = new Letterclick.Views.GameStateView(model: state, game_view: @)
    @model.on 'change', @render, @
    @model.fetch()

  render: ->
    letters = @model.get('letters')
    rows = (letters.substr(i, 5) for i in [0..20] by 5)
    $board = $('<table>', class: 'board')
    @render_row($board, row) for row in rows
    @$el.empty()
    @$el.append $board
    @$el.append $('<div>', class: 'word')
    @

  render_row: ($board, row) ->
    $row = $('<tr>', class: 'row')
    $row.append $('<td>', class: 'letter', text: letter) for letter in row
    $board.append $row
