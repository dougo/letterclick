# Like chai-jquery, but for minitest.js.

assert = minitest.assert
refute = minitest.refute
utils  = minitest.utils

assert.hasText = (text, obj, msg) ->
  assert.equal text, obj.text(),
    utils.message(msg, 'Expected %{act} to have text "%{exp}"', act: obj, exp: text)
# TODO: this message isn't actually getting used...

assert.hasClass = (className, obj, msg) ->
  assert obj.hasClass(className),
    utils.message(msg, 'Expected %{act} to have class "%{exp}"', act: obj, exp: className)
refute.hasClass = (className, obj, msg) ->
  refute obj.hasClass(className),
    utils.message(msg, 'Expected %{act} to not have class "%{exp}"', act: obj, exp: className)
