# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class HomeController
  constructor: (@$http) ->
    @$http.get('/games.json').then((res) =>
      @all_games = res.data
    )

HomeController.$inject = ['$http']
angular.module('sagrada', []);

angular.module('sagrada')
  .controller('HomeController', HomeController)

