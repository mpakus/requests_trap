#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require_tree ./controllers/

class RequestTrap
  constructor: ->
    @requests = new Requests

$(document).ready -> new RequestTrap
