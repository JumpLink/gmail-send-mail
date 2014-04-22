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

exports.EMailSetting = () ->
    return {
        restrict: "C"
        , controller: 'EMailSettingController'
    }

exports.EMailContent = () ->
    return {
        restrict: "C"
        , controller: 'EMailContentController'
    }