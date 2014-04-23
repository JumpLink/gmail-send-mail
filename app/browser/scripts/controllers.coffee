exports.mainController = ($rootScope, $scope, WindowService, $window, $timeout) ->
    $scope.showDevTools = WindowService.showDevTools

    $scope.width = WindowService.Window.width
    $scope.height = WindowService.Window.height

    WindowService.Window.on 'resize', (width, height) ->
        $scope.width = width
        $scope.height = height
        $scope.$apply()
        console.log('resize')

    $scope.orightml = '<h2>Try me!</h2><p>textAngular is a super cool WYSIWYG Text Editor directive for AngularJS</p><p><b>Features:</b></p><ol><li>Automatic Seamless Two-Way-Binding</li><li>Super Easy <b>Theming</b> Options</li><li style="color: green;">Simple Editor Instance Creation</li><li>Safely Parses Html for Custom Toolbar Icons</li><li class="text-danger">Doesn&apos;t Use an iFrame</li><li>Works with Firefox, Chrome, and IE8+</li></ol><p><b>Code at GitHub:</b> <a href="https://github.com/fraywing/textAngular">Here</a> </p>'
    $scope.htmlcontent = $scope.orightml

    $rootScope._showToolbar = false

    gotToHideToolbar = false

    $rootScope.showToolbar = () ->
        console.log("showToolbar")
        gotToHideToolbar = false
        $rootScope._showToolbar = true


    $rootScope.hideToolbar = () ->
        console.log("hideToolbar")
        gotToHideToolbar = true
        timer = $timeout ( ->
            if gotToHideToolbar == true
                $rootScope._showToolbar = false
        ), 2000





exports.PanelHeadingController = ($scope, $rootScope, $element, WindowService) ->
    $scope.close = WindowService.close
    $scope.toggleMax = WindowService.toggleMax
    $scope.minimize = WindowService.minimize

    applyResize = () ->
        $rootScope.headerWidth = $element[0].offsetWidth
        $rootScope.headerHeight = $element[0].offsetHeight
        $scope.$apply()

    WindowService.Window.on 'resize', (width, height) ->
        applyResize()

    WindowService.Window.on 'loaded', (width, height) ->
        applyResize()

exports.EMailSettingController = ($scope, $rootScope, $element, WindowService) ->

    applyResize = () ->
        $rootScope.settingWidth = $element[0].offsetWidth
        $rootScope.settingHeight = $element[0].offsetHeight
        $scope.$apply()

    WindowService.Window.on 'resize', (width, height) ->
        applyResize()

    WindowService.Window.on 'loaded', (width, height) ->
        applyResize()

exports.EMailContentController = ($scope, $rootScope, $element, WindowService) ->

    applyResize = () ->
        $rootScope.contentWidth = $element[0].offsetWidth
        $rootScope.contentHeight = $element[0].offsetHeight
        $scope.$apply()

    WindowService.Window.on 'resize', (width, height) ->
        applyResize()

    WindowService.Window.on 'loaded', (width, height) ->
        applyResize()

exports.PanelFooterController = ($scope, $rootScope, $element, WindowService, $templateCache, $sce) ->

    applyResize = () ->
        $rootScope.footerWidth = $element[0].offsetWidth
        $rootScope.footerHeight = $element[0].offsetHeight
        $scope.$apply()

    WindowService.Window.on 'resize', (width, height) ->
        applyResize()

    WindowService.Window.on 'loaded', (width, height) ->
        applyResize()

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
        "label": $sce.trustAsHtml($templateCache.get('partials/font-sans-serif')),
        "value": "sans-serif"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-serif')),
        "value": "serif"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-wide')),
        "value": "wide"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-narrow')),
        "value": "narrow"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-comic-sans-ms')),
        "value": "comic-sans-ms"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-courier-new')),
        "value": "courier-new"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-garamond')),
        "value": "garamond"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-georgia')),
        "value": "georgia"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-tahoma')),
        "value": "tahoma"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-trebuchet-ms')),
        "value": "trebuchet-ms"
      },
      {
        "label": $sce.trustAsHtml($templateCache.get('partials/font-verdana')),
        "value": "verdana"
      }
    ]
