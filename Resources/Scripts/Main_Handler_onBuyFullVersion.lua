--------------------------------------------------------------------------------
--  Handler.......... : onBuyFullVersion
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Open the URL for to buy the fulle version of the application.
--                      This handler is mostly used for mobile lite version
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onBuyFullVersion (  )
--------------------------------------------------------------------------------

    local sURL
    local osType = system.getOSType ( )

    if     ( osType == system.kOSTypeIPhone )
    then        
        sURL = application.getCurrentUserEnvironmentVariable ( "system.url.ITunesFullVersion" )
        
    elseif ( osType == system.kOSTypeAndroid)
    then
        sURL = application.getCurrentUserEnvironmentVariable ( "system.url.AndroidFullVersion" )

    elseif ( osType == system.kOSTypeBlackBerry )
    then
        sURL = application.getCurrentUserEnvironmentVariable ( "system.url.BlackBerryFullVersion" )
    end

    if ( sURL ~= nil)
    then
        system.openURL ( sURL, "_blank" )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
