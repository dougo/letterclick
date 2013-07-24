The following RESTful endpoints are available.  They consume and return JSON.

* `GET /api/v1/games/1234` - The details of game 1234.

  Response body example:

        {
          "id": 1234,
          "letters": "GTEFQIDOEMEWEETMDIFAIULNK",
          "created_at": "2013-07-03T23:21:06.711Z",
          "updated_at": "2013-07-03T23:21:06.711Z"
        }

  The letters on the gameboard are listed from top to bottom and left
  to right.  The above example has "GTEFQ" as the first row of the
  square.

* `GET /api/v1/games` - An index of all games, as an array.

* `POST /api/v1/games` - Create a new game.

  The request body should be empty.  The response has status 201, with
  the created game object as the body (see above).

* `GET /api/v1/games/1234/state` - The current state of game 1234.

  Response body example:

        {
          "id": 1,
          "game_id": 1234,
          "created_at": "2013-07-03T23:21:06.718Z",
          "updated_at": "2013-07-03T23:21:06.718Z",
          "turn": 1,
          "squares": [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        }

  The turn attribute is an integer starting at 1.

  Each element of the squares array is either 0 for an unclaimed
  letter or 1 or 2 for a letter claimed by player 1 or player 2,
  respectively.

  Note that "locked" squares are not indicated explicitly; a square is
  locked if it is claimed and all its neighbors are claimed by the
  same player.

* `GET /api/v1/games/1234/states` - All the states of game 1234, as an array.

* `POST /api/v1/games/1234/moves` - Make a move in game 1234.

  Request body example:

        {
          "move": {
            "seat": 1,
            "indices": [9, 5, 22, 24]
          }
        }

  The seat is 1 or 2 for player 1 or player 2, respectively.

  The indices are 0-based indices into the letters string of the game
  object.

  If the move is valid, the response has status 201, with the created
  move object as the body (see below).

* `GET /api/v1/games/1234/moves` - All the moves of game 1234, as an array.

  Response body example:

        [
          {
            "id": 1,
            "game_id": 1234,
            "indices": [9, 5, 22, 24]
            "created_at": "2013-07-24T02:50:02.866Z"
            "updated_at": "2013-07-24T02:50:02.866Z"
            "turn": 1,
            "seat": 1,
            "word": "MILK"
          }
        ]
