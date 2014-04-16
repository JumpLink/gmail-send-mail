exports.PanelHeading = () ->
    return {
        restrict: "C"
        , controller: 'PanelHeadingController'
    }

exports.PanelFooter = () ->
    return {
        restrict: "C"
        , controller: 'PanelFooterController'
    }