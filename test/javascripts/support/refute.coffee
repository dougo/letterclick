# MiniTest-style refute as the negation of assert.
# TODO: fork chaijs/chai to add these

assert = chai.assert
Assertion = chai.Assertion

# TODO: doc comments
refute = chai.refute = (expr, msg) -> assert !expr, msg

refute.ok = assert.notOk
refute.equal = assert.notEqual
refute.strictEqual = assert.notStrictEqual
refute.deepEqual = assert.notDeepEqual
refute.isTrue = (val, msg) -> new Assertion(val, msg).is.not['true']
refute.isFalse = (val, msg) -> new Assertion(val, msg).is.not['false']
refute.isNull = assert.isNotNull
refute.isDefined = assert.isUndefined
refute.isFunction = assert.isNotFunction
refute.isObject = assert.isNotObject
refute.isArray = assert.isNotArray
refute.isString = assert.isNotString
refute.isNumber = assert.isNotNumber
refute.isBoolean = assert.isNotBoolean
refute.typeOf = assert.notTypeOf
refute.instanceOf = assert.notInstanceOf
refute.include = assert.notInclude
refute.match = assert.notMatch
refute.property = assert.notProperty
refute.deepProperty = assert.notDeepProperty
refute.propertyVal = assert.propertyNotVal
refute.deepPropertyVal = assert.deepPropertyNotVal
refute.lengthOf = (obj, len, msg) ->
  new Assertion(obj, msg).not.to.have.length(len)
refute['throw'] = refute['throws'] = refute.Throw = assert.doesNotThrow
# TODO: refute.operator = (val1, operator, val2, msg) ->
refute.closeTo = (act, exp, delta, msg) ->
  new Assertion(act, msg).not.to.be.closeTo(exp, delta)
refute.sameMembers = (set1, set2, msg) ->
  new Assertion(set1, msg).not.to.have.same.members(set2)
refute.includeMembers = (superset, subset, msg) ->
  new Assertion(superset, msg).to.include.members(subset)
