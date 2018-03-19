




-- lvl1=
function initlvl1()
  
  ply.x=pfw/2
  ply.y=pfh/5
 onea={
	bg=love.graphics.newImage("level1/onea.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		createbox((1/4),(2/7)),
		createbox((3/4),(2/7)),
		createbox((1/4),(3/7)),
		createbox((3/4),(3/7)),
		createfire((1/5),(5/7)),
		createfire((4/5),(5/7)),
		-- createbox((1/2),(1/4)),
		createexit((1/2),(15/16)),
	}
 }
 

 oneb={
	bg=love.graphics.newImage("level1/oneb.png"),
	gos={
		createfire((1/8),(1/3)),
		createfire((1/8),(2/3)),
		createbox((1/4),(1/4)),
		createbox((1/4),(1/2)),
		createbox((1/4),(3/4)),
		createfire((4/5),(1/2)),
		-- createfire((9/10),(1/3)),
		-- createfire((9/10),(2/3)),
		createexit((15/16),(1/2)),
		createexit((1/2),(0)),
	}
 }
 onec={
	bg=love.graphics.newImage("level1/onec.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/3),(3/6)),
		-- createbox((1/2),(4/6)),
		createbox((1/3),(5/6)),
		createbox((2/3),(3/6)),
		createbox((1/2),(3/6)),
		createfire((1/2),(1/4)),
		createfire((2/3),(1/4)),
		createfire((3/4),(7/8)),
		createexit((1/2),(15/16)),
		createexit((0),(1/2)),
	}
 }
 oned={
	bg=love.graphics.newImage("level1/oned.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		createfire((3/4),(1/2)),
		createfire((1/4),(1/2)),
		createbox((1/2),(1/2)),
		createbox((1/3),(1/2)),
		createbox((2/3),(1/2)),
		createbox((3/4),(1/3)),
		createbox((3/4),(1/6)),
		createexit((1/2),(1/10)),
		createexit((1/2),(9/10)),
		
	}
 }
 onee={
	bg=love.graphics.newImage("level1/onee.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		createbox((3/7),(1/3)),
		createbox((5/7),(1/3)),
		createbox((4/7),(1/3)),

		createbox((2/7),(1/2)),
		createfire((3/7),(1/2)),
		createbox((6/7),(1/2)),
		createfire((5/7),(1/2)),
		createbox((4/7),(1/2)),

		createbox((3/7),(2/3)),
		createbox((5/7),(2/3)),
		createbox((4/7),(2/3)),

		createbox((3/7),(4/5)),
		createbox((5/7),(4/5)),

		createfire((2/7),(4/5)),
		createfire((4/7),(4/5)),
		createfire((6/7),(4/5)),

		
		createexit((1/2),0),
		-- createexit((0),(1/2)),
	}
 }
 onef={
	bg=love.graphics.newImage("level1/onef.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	}
 }
 -- oneb={}
 -- onec={}

 mzx=2
 mzy=4
 
 lvl={}
 maxslot=2*4
 for i=0,8
 do
	lvl[i]=nil
 end
 
 lvl[0]=onea
 lvl[2]=oneb
 lvl[3]=onec
 lvl[5]=oned
 -- lvl[6]=onef
 lvl[7]=onee

 cx=0
 cy=0
 curscreen=onea
 
 love.audio.play(ambiance)
end


function checkvictory()
--checking if no fire left in any room 
 for i=0,8
 do
  if lvl[i]~=nil then
   for j,o in pairs (lvl[i].gos)
   do
    if o.blockvictory~=nil then
	
	 return false
	end
   end
  end
 end
 print("victory")
 return true
 
end



function navigate(mox,moy,nx,ny)

	cx=cx+mox
	cy=cy+moy
	offset=cx+cy*mzx
	print("new screen number "..offset)
	curscreen=lvl[offset]
	bullets={}
	ply.x=nx
	ply.y=ny
end