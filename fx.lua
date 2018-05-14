
splashframes={
	loadfilter("splash/s1.png"),
	loadfilter("splash/s2.png"),
	loadfilter("splash/s3.png"),
	loadfilter("splash/s4.png"),
}

smokeframes={
	loadfilter("smoke/smoke1.png"),
	loadfilter("smoke/smoke2.png"),
	loadfilter("smoke/smoke3.png"),
	loadfilter("smoke/smoke4.png"),
	-- love.graphics.newImage("smoke/smoke5.png")
}

function fxbhv(fx,i)
	fx.anclk=fx.anclk+1
	if fx.anclk >= animchge then
		if fx.fnum>= tbllngth(fx.frames) then
		 table.remove(curscreen.gos,i)
		else
		 fx.fnum=fx.fnum+1
		 fx.anclk=0
		 fx.pic=fx.frames[fx.fnum]
		end
	end
end

function createfx(pcx,pcy,frames)
	ret={}
	ret.frames=frames
	ret.fnum=1
	ret.pic=frames[1]
	
	ret.x=pfw*pcx-ret.pic.data:getWidth()/2
	ret.y=pfh*pcy-ret.pic.data:getHeight()/2
	ret.bfunc=fxbhv
	ret.anclk=0

	print("fx at "..ret.x.." "..ret.y)
	-- print(curscreen)
	-- table.insert(curscreen.gos,ret)
	return ret
end