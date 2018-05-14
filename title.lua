 pb1=loadfilter("pressbutton/pb1.png")
 pb2=loadfilter("pressbutton/pb2.png")
 pbframes={
	pb1,
	pb2,
	pb2
	}
--workaround for 3 steps anim clk

function inittitle()
	titlewait=60
	trailerwait=600
end

function drawtitle()



 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.draw(title,0,0)

 -- love.graphic.draw(rank1,320,240)

 if titlewait==0 then
	-- print(animstep)
	love.graphics.draw(pbframes[animstep].pic,cvsw-64,cvsh-64)
 end
 
 
 
 love.graphics.print("v 1.5 love11",0,0)

 
 -- love.graphics.print("Last gamepad button pressed: "..lastbutton, 10, 10)
 rdrvscreen()
end

function updatetitle()
 tickanimstep()

 if love.keyboard.isDown("v") then
	initvideo()
	updatefunc=updatevideo
	drawfunc=drawvideo
	return
 end
 
 if titlewait>0 then
	titlewait=titlewait-1
 else
	j=polljoy()
	 if love.keyboard.isDown("space") or fingeroneid~=nil or j.mainfire~=nil then
	 inittuto()
	  drawfunc=drawtuto
	  updatefunc=updatetuto
	  return
	 end
	
 end

 if trailerwait>0 then
	trailerwait=trailerwait-1
 else
	initvideo()
	updatefunc=updatevideo
	drawfunc=drawvideo
	return
  
 end
 
end
