#= require ./refute

# For some reason, the chai-jquery plugin doesn't provide TDD assertions.

assert = chai.assert
refute = chai.refute
Assertion = chai.Assertion

# TODO: doc comments
assert.hasText = (obj, text, msg) ->
  new Assertion(obj, msg).to.have.text text

assert.hasClass = (obj, class_name, msg) ->
  new Assertion(obj, msg).to.have.class class_name
assert.hasNoClass = (obj, class_name, msg) ->
  new Assertion(obj, msg).not.to.have.class class_name
refute.hasClass = assert.hasNoClass
