
function initvideo()

 -- video = love.graphics.newVideo( 'test.ogv' )
 video:play()
end

function updatevideo()
 j=polljoy()

 if love.keyboard.isDown("space") or j.a==true then
  video:pause()
  inittitle()
  updatefunc=updatetitle
  drawfunc=drawtitle
 end
end


function drawvideo()
 love.graphics.setCanvas(vscreen)
 
 love.graphics.draw(video)
  rdrvscreen()

end