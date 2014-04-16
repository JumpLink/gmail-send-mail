exports.mainController = ($rootScope, $scope, WindowService) ->
    $scope.showDevTools = () ->
        WindowService.showDevTools()
    $scope.width = WindowService.Window.width
    $scope.height = WindowService.Window.height

    WindowService.Window.on 'resize', (width, height) ->
        $scope.width = width
        $scope.height = height
        $scope.$apply()

exports.PanelHeadingController = ($rootScope, $element) ->
    console.log($element)
    $rootScope.headerWidth = () -> $element[0].offsetWidth
    $rootScope.headerHeight = () -> $element[0].offsetHeight

exports.PanelFooterController = ($rootScope, $element) ->
    console.log($element)
    console.log("PanelFooterController")
    $rootScope.footerWidth = () -> $element[0].offsetWidth
    $rootScope.footerHeight = () -> $element[0].offsetHeight