exports.mainController = ($rootScope, $scope, WindowService) ->
    $scope.showDevTools = WindowService.showDevTools

    WindowService.Window.on 'resize', (width, height) ->
        $scope.width = width
        $scope.height = height
        $scope.$apply()

    $scope.width = WindowService.Window.width
    $scope.height = WindowService.Window.height

exports.PanelHeadingController = ($scope, $rootScope, $element, WindowService) ->
    $scope.close = WindowService.close
    $scope.toggleMax = WindowService.toggleMax
    $scope.minimize = WindowService.minimize

    $rootScope.headerWidth = $element[0].offsetWidth
    $rootScope.headerHeight = $element[0].offsetHeight

exports.PanelFooterController = ($scope, $rootScope, $element, $templateCache, $sce) ->

    $rootScope.footerWidth = $element[0].offsetWidth
    $rootScope.footerHeight = $element[0].offsetHeight

    $scope.dropdown = [
      {
        "text": "<i class=\"fa fa-eraser\"></i>&nbsp;Plain text mode",
        "click": "$alert(\"Plain text mode.\")"
      },
      {
        "divider": true
      },
      {
        "text": "<i class=\"fa fa-print\"></i>&nbsp;Print",
        "click": "$alert(\"Holy guacamole!\")"
      }
    ]

    $scope.fonts = [

      {
        "text": "<i class=\"fa fa-check\"></i>&nbsp;"+$sce.trustAsHtml($templateCache.get('partials/font-sans-serif')),
        "click": "$alert(\"Plain text mode.\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-serif')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-wide')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-narrow')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-comic-sans-ms')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-courier-new')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-garamond')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-georgia')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-tahoma')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-trebuchet-ms')),
        "click": "$alert(\"Holy guacamole!\")"
      },
      {
        "text": $sce.trustAsHtml($templateCache.get('partials/font-verdana')),
        "click": "$alert(\"Holy guacamole!\")"
      }
    ]
