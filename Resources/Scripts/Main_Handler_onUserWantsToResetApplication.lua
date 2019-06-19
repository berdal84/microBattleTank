--------------------------------------------------------------------------------
--  Handler.......... : onUserWantsToResetApplication
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Open a popup to confirm before to reset the application
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onUserWantsToResetApplication (  )
--------------------------------------------------------------------------------

    local sText = application.getCurrentUserEnvironmentVariable( "Text.QuestionUserWantsToResetApplication")
    user.sendEvent ( this.getUser ( ), "WindowManager", "onWindowNewQuestion", sText ,"Main", "onUserWantsToResetApplication_Confirmed" )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
