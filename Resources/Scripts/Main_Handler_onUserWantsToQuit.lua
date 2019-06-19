--------------------------------------------------------------------------------
--  Handler.......... : onUserWantsToQuit
--  Author........... : Bérenger Calle-Cort
--  Description...... : Display a popup to confirm or not to quit the application.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onUserWantsToQuit (  )
--------------------------------------------------------------------------------

    local sText = application.getCurrentUserEnvironmentVariable( "Text.QuestionQuitApplication")
    user.sendEvent ( this.getUser ( ), "WindowManager", "onWindowNewQuestion", sText, "Main", "onUserWantsToQuit_Confirmed" )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
