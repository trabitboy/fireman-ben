
difselframes={
	-- bg=loadfilter("intro/bgts.png"),
	-- truck={
		-- loadfilter("intro/t1ts.png"),
		-- loadfilter("intro/t2ts.png"),
		-- loadfilter("intro/t3ts.png"),
		-- loadfilter("intro/t4ts.png"),
		-- loadfilter("intro/t5ts.png"),
		-- loadfilter("intro/t6ts.png"),
		-- loadfilter("intro/t7ts.png"),
	-- }
}

function initdifsel()
 difselwait=60


end



function updatedifsel()
 

 tickanimstep()

 if difselwait>0 then
	difselwait=difselwait-1
 else
 
	 j=polljoy()
    score=0
    lives=3
	 
	 if love.keyboard.isDown("space")  or j.mainfire~=nil  then
		startgame(1)
	 end
	 
	 if love.keyboard.isDown("left") or j.left then
		print('easy mode')
	 end

	 if love.keyboard.isDown("up") or j.up then
		print('normal mode')
	 end
	 
	 if love.keyboard.isDown("right") or j.right then
		print('hard mode')
	 end
	 
 end
end



function drawdifsel()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 -- love.graphics.draw(intro.bg,0,0)
  love.graphics.setColor(255,255,255,255) 

 -- love.graphics.printf("letting food pass by calms everyone ",100,330,300,"center")

 if difselwait==0 then
	-- print(animstep)
	love.graphics.draw(pbframes[animstep],cvsw-64,cvsh-64)
 end

 -- love.graphics.print("your score",200,300)
 -- love.graphics.print(score,200,400)
 rdrvscreen()
end 