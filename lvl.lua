
--level globals
lvlglob={
	current=1,	

}

function globinit()
 --resets rank, etc
  overlayopacity=0
  
  rank=1
  rankcounter=0  
  gameobjs={}
  bullets ={}
  tickupinhib=60
  bulletinhib=0
 
end


-- lvl1=
function initlvl1()
  
  globinit()
  
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
		createexit((1/2),0),
		createexit((1/2),1),
		
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
		createbox((3/7),(1/3)+(1/10)),
		createbox((5/7),(1/3)+(1/10)),
		createbox((4/7),(1/3)+(1/10)),

		createbox((2/7),(1/2)+(1/10)),
		createfire((3/7),(1/2)+(1/10)),
		createbox((6/7),(1/2)+(1/10)),
		createfire((5/7),(1/2)+(1/10)),
		createbox((4/7),(1/2)+(1/10)),

		createbox((3/7),(2/3)+(1/10)),
		createbox((5/7),(2/3)+(1/10)),
		createbox((4/7),(2/3)+(1/10)),

		createbox((3/7),(4/5)+(1/10)),
		createbox((5/7),(4/5)+(1/10)),

		createfire((2/7),(4/5)+(1/10)),
		createfire((4/7),(4/5)+(1/10)),
		createfire((6/7),(4/5)+(1/10)),

		
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

-- lvl2=
function initlvl2()
  globinit() 
  ply.x=pfw/2
  ply.y=pfh/5
 require("level2.oneaw")

  onea={
	bg=love.graphics.newImage("level2/1a.png"),
	gos={
		-- createfx(1/2,1/2,smokeframes),
		-- createbox((1/4),(2/7)),
		-- createbox((3/4),(2/7)),
		-- createbox((1/4),(3/7)),
		-- createbox((3/4),(3/7)),
		-- createfire((1/5),(5/7)),
		-- createfire((4/5),(5/7)),
		-- createbox((1/2),(1/4)),
		createexit((15/16),(1/2)),
		createexit((1/2),(15/16)),
	},
	walls=oneaw,
 }
 

 require("level2.onebw")
 print(onebw)
 oneb={
	bg=love.graphics.newImage("level2/1b.png"),
	gos={
		createfire((3/4),(1/2),1,bluefireframes,true),
		-- createfire((1/8),(1/3)),
		-- createfire((1/8),(2/3)),
		-- createbox((1/4),(1/4)),
		-- createbox((1/4),(1/2)),
		-- createbox((1/4),(3/4)),
		-- createfire((4/5),(1/2)),
		-- createfire((9/10),(1/3)),
		-- createfire((9/10),(2/3)),
		createexit((15/16),(1/2)),
		createexit((1/16),(1/2)),
	},
	walls=onebw,
 }
 
  require("level2.onecw")

 onec={
	bg=love.graphics.newImage("level2/1c.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/3),(3/6)),
		-- createbox((1/2),(4/6)),
		-- createbox((1/3),(5/6)),
		-- createbox((2/3),(3/6)),
		-- createbox((1/2),(3/6)),
		-- createfire((1/2),(1/4)),
		-- createfire((2/3),(1/4)),
		-- createfire((3/4),(7/8)),
		createexit((1/2),(15/16)),
		createexit((0),(1/2)),
	},
	walls=onecw,
 }
 twoa={
	bg=love.graphics.newImage("level2/2a.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createfire((3/4),(1/2)),
		-- createfire((1/4),(1/2)),
		-- createbox((1/2),(1/2)),
		-- createbox((1/3),(1/2)),
		-- createbox((2/3),(1/2)),
		-- createbox((3/4),(1/3)),
		-- createbox((3/4),(1/6)),
		-- createexit((1/2),(1/10)),
		-- createexit((1/2),(9/10)),
		createexit((1/2),0),
		createexit((1/2),15/16),
		
	}
 }
 twoc={
	bg=love.graphics.newImage("level2/2c.png"),
	gos={
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((3/7),(1/3)),
		-- createbox((5/7),(1/3)),
		-- createbox((4/7),(1/3)),

		-- createbox((2/7),(1/2)),
		-- createfire((3/7),(1/2)),
		-- createbox((6/7),(1/2)),
		-- createfire((5/7),(1/2)),
		-- createbox((4/7),(1/2)),

		-- createbox((3/7),(2/3)),
		-- createbox((5/7),(2/3)),
		-- createbox((4/7),(2/3)),

		-- createbox((3/7),(4/5)),
		-- createbox((5/7),(4/5)),

		-- createfire((2/7),(4/5)),
		-- createfire((4/7),(4/5)),
		-- createfire((6/7),(4/5)),

		
		createexit((1/2),0),
		createexit((1/2),15/16),
	}
 }
 require("level2.threeaw")
 threea={
	bg=love.graphics.newImage("level2/3a.png"),
	gos={
		createexit((1/2),0),
		createexit(15/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	},
	walls=threeaw,
 }
 createbfs(threea.gos,threeawbfs)
 
 require("level2.threebw")
 threeb={
	bg=love.graphics.newImage("level2/3b.png"),
	gos={
		createexit(0,(1/2)),
		createexit(1,(1/2)),
		-- createexit(15/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	},
	walls=threebw,
 }
 createbfs(threeb.gos,threebwbfs)
 
 
 threec={
	bg=love.graphics.newImage("level2/3c.png"),
	gos={
		createexit((1/2),0),
		createexit(1/16,(1/2)),
		-- createfire((6/8),(1/2)),
		-- createbox((1/2),(1/4)),
		-- createexit((1/8),(1/2)),
	}
 }
 -- oneb={}
 -- onec={}

 mzx=5
 mzy=4
 
 lvl={}
 maxslot=5*4
 for i=0,maxslot
 do
	lvl[i]=nil
 end
 
 --onea    oneb   onec
 --twoa           twoc
 --threea threeb threec threed threee
 --       fourb  fourc  fourd
 
 lvl[0]=onea
 lvl[1]=oneb
 lvl[2]=onec
 lvl[5]=twoa
 -- lvl[6]=onef
 lvl[7]=twoc
 lvl[10]=threea
 lvl[11]=threeb
 lvl[12]=threec
 cx=1
 cy=0
 curscreen=oneb
 
 love.audio.play(ambiance)
end



levels={initlvl1,initlvl2}



--true if blocking hasard
function checkroom(r)
   for j,o in pairs (lvl[r].gos)
   do
    if o.blockvictory~=nil then
	
	 return true
	end
   end
   return false
end

function checkvictory()
--checking if no fire left in any room 
 for i=0,(mzx*mzy-1)
 do
  if lvl[i]~=nil then
   if checkroom(i) then return false end --not victory , at least one hazard
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