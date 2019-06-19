--------------------------------------------------------------------------------
--  Handler.......... : onRotateViewport
--  Author........... : Bérenger Dalle-Cort
--  Description...... : Rotate the viewport by +180° each call
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function Main.onRotateViewport (  )
--------------------------------------------------------------------------------

    local nViewportRotation = application.getOption ( application.kOptionViewportRotation )
    application.setOption ( application.kOptionViewportRotation, math.mod( nViewportRotation + 2, 4) ) -- there are 4 orientations: 0,1,2,3 for a phone/tablet, by adding two we rotate by 180°

--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
