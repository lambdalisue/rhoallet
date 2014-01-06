#
# Segment class
#
class Segment
  #
  # Constructor
  #
  # @param int n    the number of steps
  # @param float s  start point
  # @param float e  end point
  # @param func fu  easing function
  #
  constructor: (@n, @s=0, @e=1.0, fn='linear') ->
    # IE less than 8 does not support `Object.defineProperty` but so what?
    Object.defineProperty this, 'fn',
      get: -> fn
      set: (value) ->
        fn = value
        # use jQuery easing function if the function is string
        fn = $.easing[fn] if typeof fn is 'string'
    # make sure that fn is not string instance
    @fn = fn

  #
  # Convert segment to array
  #
  # @return array   a list of float values
  #
  toArray: ->
    [n, s, e, fn, d] = [@n, @s, @e, @fn, @e-@s]
    return (s + fn(i/n) * d for i in [0...n])

