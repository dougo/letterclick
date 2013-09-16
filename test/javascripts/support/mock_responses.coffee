window.MockServer ?= sinon.fakeServer.create()

MockServer.respondWith(
  'GET',
  '/api/v1/games/1',
  [
    200,
    { 'Content-Type': 'application/json' },
    '''
    {
      "id": 1,
      "letters": "ABCDEFGHIJKLMNOPQRSTUVWXY",
      "created_at": "2013-07-03T23:21:06.711Z",
      "updated_at": "2013-07-03T23:21:06.711Z"
    }
    '''
  ]
)

squares = (0 for i in [1..25])

word_indices = (l.charCodeAt(0) - 'A'.charCodeAt(0) for l in 'WORD')
game_indices = (l.charCodeAt(0) - 'A'.charCodeAt(0) for l in 'GAME')

squares[i] = 1 for i in word_indices
squares[i] = 2 for i in game_indices

MockServer.respondWith(
  'GET',
  '/api/v1/games/1/state',
  [
    200,
    { 'Content-Type': 'application/json' },
    """
    {
      "id": 1,
      "game_id": 1,
      "created_at": "2013-07-03T23:21:06.711Z",
      "updated_at": "2013-07-03T23:21:06.711Z",
      "turn": 2,
      "squares": #{JSON.stringify squares}
    }
    """
  ]
)
