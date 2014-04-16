require("../third-party/angular/angular")
require("../third-party/mgo-mousetrap/mousetrap")
require("../third-party/mgo-mousetrap/wMousetrap")

controllers = require('./controllers')
services = require('./services')
directives = require('./directives')

global.app = angular.module('gmail-send-mail', ['mgo-mousetrap'])

global.app.service('PlatformService', services.PlatformService)
global.app.service('WindowService', services.WindowService)
global.app.service('GuiService', services.GuiService)

global.app.controller('mainController', controllers.mainController)
global.app.controller('PanelHeadingController', controllers.PanelHeadingController)
global.app.controller('PanelFooterController', controllers.PanelFooterController)

global.app.directive('panelHeading', directives.PanelHeading)
global.app.directive('panelFooter', directives.PanelFooter)
