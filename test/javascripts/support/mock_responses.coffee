window.MockServer ?= sinon.fakeServer.create()

MockServer.respondWith(
  'GET',
  '/api/v1/games/1',
  [
    200,
    { 'Content-Type': 'application/json' },
    '''
    {
      "id": 2,
      "letters": "ABCDEFGHIJKLMNOPQRSTUVWXY",
      "created_at": "2013-07-03T23:21:06.711Z",
      "updated_at": "2013-07-03T23:21:06.711Z"
    }
    '''
  ]
)

