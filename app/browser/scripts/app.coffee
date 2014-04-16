require("../third-party/angular/angular")
require("../third-party/mgo-mousetrap/mousetrap")
require("../third-party/mgo-mousetrap/wMousetrap")

controllers = require('./controllers')
services = require('./services')

console.log(services)

global.app = angular.module('gmail-send-mail', ['mgo-mousetrap'])

global.app.service('PlatformService', services.PlatformService)
global.app.service('WindowService', services.WindowService)
global.app.service('GuiService', services.GuiService)
global.app.controller('mainController', controllers.mainController)

# WindowHandler = require './windowHandler'
# Platform = require './platform'



# global.app.platform = new Platform()
# global.app.windowHandler = new WindowHandler()


