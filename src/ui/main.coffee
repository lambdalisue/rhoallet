#<< options
#<< ui/pallet
#<< ui/controller
#<< ui/background-mode

jQuery ->
  opts = Options.deserialize(decodeURIComponent(location.search.substr(1)))
  output = $('#output pre')
  # select text by clicking
  output.click ->
    selectAll(this)
  # background-mode
  bmode = new BackgroundMode($('#dark-mode'), $('#light-mode'))
  # pallet
  pallet = new Pallet($('#pallet div'), output, opts)
  # controller
  controller = new Controller($('#controller div'), pallet, opts)

