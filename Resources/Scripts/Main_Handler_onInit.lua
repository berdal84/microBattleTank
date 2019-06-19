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

    -- Override xml.receive too log the XML URI
    xml.receive =   function ( hXML, sURI )
                        local bOK = Main.original_xml_receive ( hXML, sURI )
                        log.message ( string.format("xml.receive called with the URI '%s'", sURI) )
                        return bOK
                    end

    -- Override system functions to simulate OS or ClientType
    --aystem.getOSType       = function ( ) return system.kOSTypeAndroid end
    --system.getOSType       = function ( ) return system.kOSTypeHTML5 end
    --system.getClientType   = function () return system.kClientTypeStandalone end

    application.setMinFrameTime ( 1/60 )

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
