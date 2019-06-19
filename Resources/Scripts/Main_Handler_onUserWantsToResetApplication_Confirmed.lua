--------------------------------------------------------------------------------
--  Handler.......... : onUserWantsToResetApplication_Confirmed
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Restart the Environment AIM and then restart Main AIM
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onUserWantsToResetApplication_Confirmed (  )
--------------------------------------------------------------------------------

    local  cbAIM, cbHandler, cbParam1 = "Main", "onApplicationRestart", ""
    user.sendEvent ( this.getUser ( ), "Environment", "onRestart", cbAIM, cbHandler, cbParam1 )

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
