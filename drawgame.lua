
function displayradar()
 love.graphics.print ("FIRE RADAR:",pfw+4,8)
 for j=0,(mzy-1)
 do
  for i=0,(mzx-1)
  do
   if lvl[mzx*j+i]~=nil then
	if checkroom(mzx*j+i) then
     love.graphics.setColor(255,0,0,255)
	else
     love.graphics.setColor(255,255,255,255)	
	end
    love.graphics.rectangle("fill",pfw+8+i*8+1,32+j*8+1,6,6)
   end
  end
 end
  love.graphics.setColor(255,255,255,255)
end

function displaygauge()
    xcur=ggx
	ycur=cvsh-16
    -- love.graphics.draw(rank3,64,64)

	-- for i=1,maxrang
	-- for i=1,8
	for i=1,rankcounter
    do
	 if i>seuil3 then
      love.graphics.draw(rank3,xcur,ycur)
	 
	 elseif i>seuil2 then
      love.graphics.draw(rank2,xcur,ycur)
	 
	 else
      love.graphics.draw(rank1,xcur,ycur)
	 end
	 ycur=ycur-16
	end
end

function drawbaddiehealth()
 if baddieobserved~=nil then
  chunks=baddieobserved.hp /10
  
  xcur=0
  ycur=0
  
  for i=1,chunks
  do
   love.graphics.draw(rank1,xcur,ycur)
   ycur=ycur+32
  end  
 
 end

end

function displayscore()
  love.graphics.draw(scoremask,512,0)
  
  love.graphics.print("score",590,100)
  love.graphics.print(score,590,115)
end

function drawhitbox(o)
 if o.hbx~=nil then
  --we have something to blit
  --TODO
  love.graphics.setColor(0,0,0,255)
  love.graphics.setLineWidth(3)
  if o.zoom~=nil then
   love.graphics.rectangle("line",o.zx+o.hbx.x,o.zy+o.hbx.y,o.hbx.w,o.hbx.h)
  else
   love.graphics.rectangle("line",o.x+o.hbx.x,o.y+o.hbx.y,o.hbx.w,o.hbx.h)
  end
  love.graphics.setColor(255,255,255,255)
 end
end

--of curr screen
function drawwallboxes()
	if curscreen.walls~=nil then
		for i,w in ipairs(curscreen.walls)
		do
		 love.graphics.rectangle("line",w.minx,w.miny,w.maxx-w.minx,w.maxy-w.miny)
		end
	end
end

function drawgame()
 love.graphics.setCanvas(vscreen)
 
 --maybe remove clear sometimes for smear effects
 -- love.graphics.setColor(255,255,255,255)
 love.graphics.clear()
 love.graphics.draw(blank,pfx,pfy)
 
 --bg display
 --redo with bg queue
 -- for i,v in pairs(bgpanes) 
 -- do 
  -- love.graphics.draw(v.pic,pfx,pfy+v.y)
 -- end
 
 love.graphics.draw(curscreen.bg,pfx,pfy)
 
 -- love.graphics.draw(devil,pfx+px,pfy+py)
 -- animstep=1
 
 if facing=="d" then
  ppic=fmanframes.down[animstep].pic 
 end
 if facing=="u" then
  ppic=fmanframes.up[animstep].pic
 end
 if facing=="l" then
  ppic=fmanframes.left[animstep].pic
 end
 if facing=="r" then
  ppic=fmanframes.right[animstep].pic
 end
 
 -- love.graphics.draw(fmanframes.up[1] ,pfx+px,pfy+py)
 
 love.graphics.draw(ppic,pfx+ply.x,pfy+ply.y)
 if displayboxs then
  drawhitbox(ply)
 end
 
 for i,v in pairs(curscreen.gos) 
 do 
 
   if v.zoom~=nil then
    love.graphics.push()
    love.graphics.scale(v.zoom, v.zoom)   -- reduce everything by 50% in both X and Y coordinates
	local w=v.picdata:getWidth()
	local h=v.picdata:getHeight()
	zoomcorrect=(1/v.zoom)
	bcx=v.cx*zoomcorrect
	bcy=v.cy*zoomcorrect
	
	bx=bcx-w/2
	by=bcy-h/2
	
    love.graphics.draw(v.pic.pic,bx,by)
   -- love.graphics.print("Scaled text", 50, 50) 
    love.graphics.pop()
   else
    love.graphics.draw(v.pic.pic,(pfx+v.x),(pfy+v.y))
   end
   --dbg
   if displayboxs then
    drawhitbox(v)
   end
 -- love.graphics.print("Normal text", 50, 50)  
 end
 
 for i,v in pairs(bullets) 
 do 
  love.graphics.setColor(1,1,1,200/255) 
  love.graphics.draw(v.pic.pic,pfx+v.x,pfy+v.y)
  love.graphics.setColor(1,1,1,1) 
 end
 
 if displayboxs then
  drawwallboxes()
 end
 -- drawbaddiehealth()
 displayscore() 
 displaygauge()
 displayradar()
 love.graphics.setColor(1,0,0,overlayopacity/255) 
 love.graphics.rectangle("fill",0,0,640,480)
 if overlayopacity>64 then
  love.graphics.setColor(1,1,1,(overlayopacity-64)/255) 
  love.graphics.draw(deathframes[animstep].pic,0,0)
 end
 
 
 if updatefunc==updatelvlintro then
  love.graphics.setColor(0,0,0,1) 
  love.graphics.rectangle("fill",200,200,100,100)
  love.graphics.setColor(1,1,1,1) 
  love.graphics.print(name,210,210)
 end

 if updatefunc==updatelvloutro then
  love.graphics.rectangle("fill",200,200,100,100)
  love.graphics.setColor(0,0,0,1) 
  love.graphics.setColor(1,1,1,1) 
  love.graphics.print('well done !',210,210)
 end


 
 love.graphics.setColor(1,1,1,1) 
 rdrvscreen()
end
