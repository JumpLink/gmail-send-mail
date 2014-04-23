require("../third-party/angular/angular")
#require("../third-party/angular-sanitize/angular-sanitize")

require("../third-party/textAngular/textAngular-sanitize")
#require("../third-party/textAngular/src/textAngularSetup")
require("../third-party/textAngular/textAngular")

require("../third-party/mgo-mousetrap/mousetrap")
require("../third-party/mgo-mousetrap/wMousetrap")

require("../third-party/angular-strap/dist/modules/dimensions")
require("../third-party/angular-strap/dist/modules/tooltip")
require("../third-party/angular-strap/dist/modules/dropdown")
require("../third-party/angular-strap/dist/modules/popover")
require("../third-party/angular-strap/dist/modules/parse-options")
require("../third-party/angular-strap/dist/modules/select")

# just for experiments
# require("/usr/share/ubuntu-html5-ui-toolkit/0.1/ambiance/js/core.js")

controllers = require('./controllers')
services = require('./services')
directives = require('./directives')

global.app = angular.module('gmail-send-mail', [
    #'ngSanitize'
    'mgo-mousetrap'
    , 'mgcrea.ngStrap.helpers.dimensions'
    , 'mgcrea.ngStrap.helpers.parseOptions'
    , 'mgcrea.ngStrap.tooltip'
    , 'mgcrea.ngStrap.dropdown'
    , 'mgcrea.ngStrap.popover'
    , 'mgcrea.ngStrap.select'
    , 'textAngular'
])

global.app.service('PlatformService', services.PlatformService)
global.app.service('WindowService', services.WindowService)
global.app.service('GuiService', services.GuiService)

global.app.controller('mainController', controllers.mainController)
global.app.controller('PanelHeadingController', controllers.PanelHeadingController)
global.app.controller('PanelFooterController', controllers.PanelFooterController)
global.app.controller('EMailSettingController', controllers.EMailSettingController)
global.app.controller('EMailContentController', controllers.EMailContentController)

global.app.directive('panelHeading', directives.PanelHeading)
global.app.directive('panelFooter', directives.PanelFooter)
global.app.directive('eMailSetting', directives.EMailSetting)
global.app.directive('eMailContent', directives.EMailContent)

# TextAngilar Default Setup
global.app.config ($provide) ->
    # this demonstrates how to register a new tool and add it to the default toolbar
    $provide.decorator "taOptions", [
        "$delegate"
        (taOptions) ->

            # $delegate is the taOptions we are decorating
            # here we override the default toolbars and classes specified in taOptions.
            taOptions.toolbar = [
                ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']
                ['p', 'pre', 'quote']
                ['bold', 'italics', 'underline']
                ['ul', 'ol']
                ['justifyLeft','justifyCenter','justifyRight']
                ['insertImage', 'insertLink', 'unlink']
                ['redo', 'undo', 'clear']
            ]

            taOptions.classes =
                focussed: "focussed"
                toolbar: "btn-toolbar"
                toolbarGroup: "btn-trans-group"
                toolbarButton: "btn btn-default btn-trans"
                toolbarButtonActive: "active"
                disabled: "disabled"
                textEditor: "form-control"
                htmlEditor: "form-control"

            return taOptions # whatever you return will be the taOptions
    ]

    # this demonstrates changing the classes of the icons for the tools for font-awesome v3.x
    # $provide.decorator "taTools", [
    #     "$delegate"
    #     (taTools) ->
    #         taTools.bold.iconclass = "icon-bold"
    #         taTools.italics.iconclass = "icon-italic"
    #         taTools.underline.iconclass = "icon-underline"
    #         taTools.ul.iconclass = "icon-list-ul"
    #         taTools.ol.iconclass = "icon-list-ol"
    #         taTools.undo.iconclass = "icon-undo"
    #         taTools.redo.iconclass = "icon-repeat"
    #         taTools.justifyLeft.iconclass = "icon-align-left"
    #         taTools.justifyRight.iconclass = "icon-align-right"
    #         taTools.justifyCenter.iconclass = "icon-align-center"
    #         taTools.clear.iconclass = "icon-ban-circle"
    #         taTools.insertLink.iconclass = "icon-link"
    #         taTools.unlink.iconclass = "icon-link red"
    #         taTools.insertImage.iconclass = "icon-picture"

    #         # there is no quote icon in old font-awesome so we change to text as follows
    #         delete taTools.quote.iconclass

    #         taTools.quote.buttontext = "quote"
    #         return taTools
    # ]
