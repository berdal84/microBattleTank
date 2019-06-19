--------------------------------------------------------------------------------
--  Handler.......... : onSoundSetActive
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Toggle Sdound ON/OFF
--                      TODO: Check where is called this handler and change its name for a more understandable one.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onSoundSetActive (  )
--------------------------------------------------------------------------------
	
	this.bIsSoundEnable ( not this.bIsSoundEnable ( ) )
	
    if ( this.bIsSoundEnable ( ) )
    then
        application.setOption ( application.kOptionAudioMasterVolume, application.getCurrentUserEnvironmentVariable ( "system.audio.defaultVolume" ) )
    else
        application.setOption ( application.kOptionAudioMasterVolume, 0 )
    end
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
