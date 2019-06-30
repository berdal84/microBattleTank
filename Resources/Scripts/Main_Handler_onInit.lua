--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Bérenger Dalle-Cort
--  Description...... :
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onInit (  )
--------------------------------------------------------------------------------
    local u = this.getUser ( )

    log.enable ( true )

    -- Override system functions to simulate OS or ClientType
    --aystem.getOSType       = function ( ) return system.kOSTypeAndroid end
    --system.getOSType       = function ( ) return system.kOSTypeHTML5 end
    --system.getClientType   = function () return system.kClientTypeStandalone end

    this.sendEvent ( "onSetDefaultMinFrameTime" )

    local sApplicationMode = application.getCurrentUserEnvironmentVariable ( "system.sApplicationMode" )

    log.message ( string.format("system.sApplicationMode = %s", sApplicationMode))

    -- Init for default mode :
    if ( sApplicationMode == "default" )
    then
        user.sendEvent ( u, "HUDManager" , "onShowHUD", 4     , "Loading, please wait..." )
        user.sendEvent ( u, "Environment", "onStart"  , "Main", "onStart" )

    -- Init for video mode :
    elseif ( sApplicationMode == "video" )
    then
        local sVideoURL = application.getCurrentUserEnvironmentVariable ( "sVideoURL" )
        user.sendEvent ( u, "Language", "onStart" )
        user.sendEvent ( u, "Recorder", "onPlay_FromURL", sVideoURL )
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
