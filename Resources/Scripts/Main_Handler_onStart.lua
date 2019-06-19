--------------------------------------------------------------------------------
--  Handler.......... : onStart
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Called by other AIM to start the Application.
--                      Some AIM needs to be started before the Main AIM (ex: Environment)
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onStart (  )
--------------------------------------------------------------------------------

    local u = this.getUser ( )

    if ( application.mightBeCracked ( ) )
    then
        user.sendEvent ( u, "WindowManager", "onWindowNewMessage", "This application is cracked, buy the original version please." )
    else
        local bOSIsTypeWindows              = system.kOSTypeWindows    == system.getOSType ( )
        local bOSIsTypeBlackBerry           = system.kOSTypeBlackBerry == system.getOSType ( )
        local bOSIsTypeIPhone               = system.kOSTypeIPhone     == system.getOSType ( )
        local bOSTypeAndroid                = system.kOSTypeAndroid    == system.getOSType ( )
        local bEnableMusic                  = true
        local bFacebook                     = application.getCurrentUserEnvironmentVariable ( "system.bFacebook" )

    -- Show HUDs
        user.postEvent ( u, 0.3, "HUDManager", "onShowHUD" , 0 ) -- main menu

        if ( bOSIsTypeIPhone or bOSTypeAndroid or bFacebook or bOSIsTypeBlackBerry)
        then
            user.sendEvent ( u, "HUDManager", "onShowHUD" , 11 , bFacebook) -- show round corner rectangle overlay.
        end

    -- Set viewport rotation on mobiles
        if ( (bOSIsTypeIPhone or bOSIsTypeBlackBerry )and not( system.getClientType ( ) == system.kClientTypeEditor))
        then
            application.setOption ( application.kOptionViewportRotation, 3 ) -- +90� (landscape right)
        else
            application.setOption ( application.kOptionViewportRotation, 0 )
        end

        application.setOption ( application.kOptionAutomaticVirtualKeyboard , 1 )
        application.setOption ( application.kOptionAudioMasterVolume        , application.getCurrentUserEnvironmentVariable ( "system.audio.defaultVolume" ) )

        system.enableLocationUpdates ( false )

    -- Intitialize all user AIM (with delay)

        local delay_short  = 0.2
        local delay_medium = 1
        local delay_long   = 2

        user.postEvent ( u, delay_short     , "Game"           , "onStart" )
        user.postEvent ( u, delay_short     , "News"           , "onStart" )
        user.postEvent ( u, delay_short     , "Factory"        , "onStart" )
        user.postEvent ( u, delay_short     , "Settings"       , "onStart" )
        user.postEvent ( u, delay_short     , "Recorder"       , "onStart" )
        user.postEvent ( u, delay_short     , "Language"       , "onStart" )

        user.postEvent ( u, delay_medium    , "InputManager"   , "onStart" )
        user.postEvent ( u, delay_medium    , "Profile"        , "onStart" )

        user.postEvent ( u, delay_long      , "HUDManager"     , "onStart" )
        user.postEvent ( u, delay_long      , "Music"          , "onEnable", bEnableMusic )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
