os = nequire 'os'

# Public:
exports.PlatformService = ($rootScope) ->

    isMac = () ->
        platformString = os.platform()

        if platformString is 'darwin'
            return true
        else
            return false

    isLinux = () ->
        platformString = os.platform()

        if platformString is 'linux'
            return true
        else
            return false

    isWindows = () ->
        platformString = os.platform()

        if platformString is '^win'
            return true
        else
            return false

    getPlatform = () ->
        platformString = os.platform()

        if platformString is 'darwin'
            return 'mac'

        else if platformString is 'linux'
            return 'linux'

        else if platformString.match '^win'
            return 'windows'

        return 'unknown'

    getVersion = () ->
        return os.release().split('.').map (item) -> parseInt(item, 10)

    # minimumVersion - dot-separated {String} of version number. E.g. 10.0.0. See [the Darwin operating system Wikipedia entry](http://en.wikipedia.org/wiki/Darwin_%28operating_system%29#Release_history) for Mac - Darwin versions.
    isOfMinimumVersion = (minimumVersion) ->
        actualVersion = getVersion()
        for piece, i in minimumVersion.split('.')
            versionPiece = parseInt(piece, 10)

            if not actualVersion[i]?
                break # e.g. 13.1 passed and actual is 13.1.0
            else if actualVersion[i] > versionPiece
                break # doesn't matter what the next bits are, the major version (or whatever) is larger
            else if actualVersion[i] is versionPiece
                continue # to check next version piece
            else
                return false
        return true # all was ok

    $rootScope.platform = {
        , name:  getPlatform()
        , isMac: isMac()
        , isLinux: isLinux()
        , isWindows: isWindows()
        , version:   getVersion()
    }

    return {
        , isMac: isMac
        , isLinux: isLinux
        , isWindows: isWindows
        , getPlatform: getPlatform
        , getVersion: getVersion
        , isOfMinimumVersion: isOfMinimumVersion
    }

exports.GuiService = () ->
    return nequire('nw.gui')

exports.WindowService = (GuiService, $rootScope, $timeout, $window) ->


    tigger = (event) ->
        $timeout () ->
            # nything you want can go here and will safely be run on the next digest.
            angular.element($window).triggerHandler(event)

    attachEvents = () ->
        window.on 'close', onClose

        # TODO
        # $windowActions
        #     .on 'click.WindowHandler', '.window-minimize', minimize
        #     .on 'click.WindowHandler', '.window-maximize', maximize
        #     .on 'click.WindowHandler', '.window-restore', restore
        #     .on 'click.WindowHandler', '.window-close', onClose

    onClose = () ->
        exit()

    close = () ->
        window.close()
        $rootScope.window.isShown = false
        $rootScope.window.isMax = false

    hide = () ->
        window.hide()
        $rootScope.window.isShown = false

    minimize = () ->
        window.minimize()
        $rootScope.window.isShown = false

    maximize = () ->
        window.maximize()
        $rootScope.window.isShown = true
        $rootScope.window.isMax = true

    unmaximize = () ->
        window.unmaximize()
        $rootScope.window.isShown = true
        $rootScope.window.isMax = false

    toggleMax = () ->
        if($rootScope.window.isMax)
            unmaximize()
        else
            maximize()

    restore = () ->
        window.restore()
        $rootScope.window.isShown = true

    show = () ->
        window.show()


    showDevTools = () ->
        window.showDevTools()

    exit = () ->
        GuiService.App.quit()

    $rootScope.window = {
        , isShown:  false
        , isMax: false
    }

    window = GuiService.Window.get()

    attachEvents()

    return {
        onClose: onClose
        , close: close
        , hide: hide
        , minimize: minimize
        , maximize: maximize
        , toggleMax: toggleMax
        , restore: restore
        , show: show
        , showDevTools: showDevTools
        , exit: exit
        , width: window.width
        , height: window.height
        , Window: window
        , tigger: tigger
    }