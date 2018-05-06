function initgameover()
	gameoverwait=60

end


function updategameover()
 tickanimstep()
 if gameoverwait>0 then
	gameoverwait=gameoverwait-1
 else
	 j=polljoy()
	 if love.keyboard.isDown("space") or fingeroneid~=nil or j.mainfire~=nil then
	  inittitle()
	  drawfunc=drawtitle
	  updatefunc=updatetitle
	 end
 end

end



function drawgameover()

 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.draw(finalpic,0,0)

 if gameoverwait==0 then
	-- print(animstep)
	love.graphics.draw(pbframes[animstep],cvsw-64,cvsh-64)
 end
 
 -- love.graphics.print("game over!",200,200)
 -- love.graphics.print("your score",200,300)

 -- love.graphics.print("you have no real score you couldn't keep them calm !",20,540)

 -- love.graphics.print(score,200,570)
 love.graphics.print("press ENTER",200,600)

 rdrvscreen()


end 