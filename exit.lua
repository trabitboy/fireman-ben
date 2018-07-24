
gap=60


exitframes={
	-- love.graphics.newImage("exit/exit1.png")
	loadfilter("exit/exit1.png"),
	loadfilter("exit/exit2.png"),
	loadfilter("exit/exit3.png")
}

function exbehavior(e,i)
	e.pic=exitframes[animstep]	
	
	--test player coll
	--if player coll go to screen
	-- if(ocoll(ply,e)) then


	--090718 replaced by new mechanism
	-- if collhbs(e.x,e.y,e.hbx,ply.x,ply.y,ply.hbx) then
		-- print("SCREEN TRANSITION "..e.mox.." "..e.moy)
		-- navigate(e.mox,e.moy,e.sp.x,e.sp.y)
	-- end
end


function calculatenav(e)

	local spawn={
	 left={x=gap,y=pfh/2-ply.h/2},
	 right={x=pfw-gap-ply.w,y=pfh/2-ply.h/2},
	 up={x=pfw/2-ply.w/2,y=gap},
	 down={x=pfw/2-ply.w/2,y=pfh-gap-ply.h}

	}

	--if exit is on n s e w,
	--calculate closes wall
	de=pfw-e.x
	dw=e.x
	dn=e.y
	ds=pfh-e.y

	local sp=nil
	
	dmin=math.min(unpack({de,dw,dn,ds}))
	if dmin==de then
		print("east exit detected")
		e.mox=1
		e.moy=0	
		e.sp=spawn.left
	elseif dmin==dw then
		print("west exit detected")
		e.mox=-1
		e.moy=0		
		e.sp=spawn.right

	elseif dmin==dn then
		print("north exit detected")
		e.mox=0
		e.moy=-1		
		e.sp=spawn.down

	elseif dmin==ds then
		print("south exit detected")
		e.mox=0
		e.moy=1		
		e.sp=spawn.up

	end
end

function createexit(pcx,pcy)
	ret={}
	ret.pic=exitframes[1]
	ret.picdata=ret.pic.data
	ret.w=exitframes[1].data:getWidth()
	ret.h=exitframes[1].data:getHeight()
	ret.x=pfw*pcx-ret.pic.data:getWidth()/2
	ret.y=pfh*pcy-ret.pic.data:getHeight()/2
	ret.bfunc=exbehavior
	ret.hbx=computebox(8,ret.picdata,1)
	calculatenav(ret)
	print("exit at "..ret.x.." "..ret.y)
	return ret
end