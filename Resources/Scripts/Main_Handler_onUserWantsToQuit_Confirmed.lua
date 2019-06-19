--------------------------------------------------------------------------------
--  Handler.......... : onUserWantsToQuit_Confirmed
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Close app or goto the website homepage on HTML5 version
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onUserWantsToQuit_Confirmed (  )
--------------------------------------------------------------------------------

    if( system.getOSType ( ) == system.kOSTypeHTML5)
    then
        system.openURL ("https://www.microbattletank.com", "_self");
    else
        application.quit ( )
    end

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
