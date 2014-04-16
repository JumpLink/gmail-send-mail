exports.mainController = ($scope, WindowService) ->
    $scope.showDevTools = () ->
        WindowService.showDevTools()