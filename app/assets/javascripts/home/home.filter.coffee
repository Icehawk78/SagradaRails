HomeFilter = () ->
  (input) ->
    out = if input then 'occupied' else 'unoccupied'
    return out

angular.module('sagrada')
  .filter('occupied', HomeFilter)