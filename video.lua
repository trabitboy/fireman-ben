
function initvideo()

 -- video = love.graphics.newVideo( 'test.ogv' )
 video:play()
end

function updatevideo()
 tickanimstep()
 j=polljoy()

 if love.keyboard.isDown("space") or j.mainfire==true  then
  video:pause()
  inittitle()
  updatefunc=updatetitle
  drawfunc=drawtitle
 end
 
 if video:isPlaying()==false then
  inittitle()
  updatefunc=updatetitle
  drawfunc=drawtitle
  
 end
end


function drawvideo()
 love.graphics.setCanvas(vscreen)
 
 love.graphics.draw(video)

 if titlewait==0 then
	-- print(animstep)
	love.graphics.draw(pbframes[animstep],cvsw-64,cvsh-64)
 end

 rdrvscreen()

end