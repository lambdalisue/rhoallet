class BackgroundMode
  constructor: (dark, light) ->
    dark.click (e) ->
      light.show()
      dark.hide()
      $(document.body).addClass('dark')
    light.click (e) ->
      light.hide()
      dark.show()
      $(document.body).removeClass('dark')
    @dark = dark
    @light = light

    hour = (new Date).getHours()
    if hour > 18 or hour < 6
      dark.click()
    else
      light.click()
