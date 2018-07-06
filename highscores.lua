-- reimplement again after notepad crash .....



serialize=require("ser")

function defaulths()
 return {
			easy={{name='baguette',score=100},{name='man',score=100},{name='barrel',score=100},{name='force',score=100},{name='slime',score=100}},
			normal={{name='baguette',score=100},{name='man',score=100},{name='barrel',score=100},{name='force',score=100},{name='slime',score=100}},
			hard={{name='baguette',score=100},{name='man',score=100},{name='barrel',score=100},{name='force',score=100},{name='slime',score=100}},
		}
end

currenttable='easy'


function loadscores()
 if love.filesystem.exists('scores.lua') then
  highscores=love.filesystem.load('scores.lua')()
 else
  highscores=defaulths()
  
 end
 print(highscores)
 -- debug.debug()
end

loadscores()

function love.quit()
 love.filesystem.write('scores.lua',serialize(highscores))
end



local timer =nil

local state=nil

local currentcharnum=nil
local name=nil

function initenterscore()
 name='aaa'
 currentcharnum=1
 state='enter'
end

function initdisplayscores()
 timer=createtimer(120)
 state='display'
end

local function char(num)
  return string.char(string.byte("a")+num-1)
end

function drawscores()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 
 local current =highscores[currenttable]
 --TODO display scores of current table
love.graphics.print(currenttable,250,50)

 sy=130
 for i,s in ipairs(current)
 do
	sy=sy+20
	
	love.graphics.print(s.name,200,sy)
	love.graphics.print(s.score,320,sy)
 end 
 
 if state=='enter' then
  love.graphics.print(name,0,0)
  love.graphics.print(char(currentcharnum),0,40)
  
 end
 
 -- love.draw(victory,0,0)
 -- love.graphics.print("YOU DID IT!",200,470)
 -- -- love.graphics.print("your score",200,300)

 -- love.graphics.print("YOU FED LIKE A PIGGIE keeping them calm !",20,500)

 -- love.graphics.print("your awesome score :",200,540)
 -- love.graphics.print(score,200,560)
 rdrvscreen()
	
end

local inhibtimer=nil

function inhibhalfsecond()
 inhibtimer=createtimer(30)

end

function updatescores()


 if state=='enter' then
  if inhibtimer~=nil then
   inhibtimer:tick()
   if inhibtimer.finished then
    inhibtimer=nil
   end
  end
 
  j=polljoy()
  --TODO move letter and validate letter
	if j.up or love.keyboard.isDown('w') and inhibtimer==nil then
	 print('dozn')
	 currentcharnum=currentcharnum+1
	 if currentcharnum>26 then
	  currentcharnum=1
	 end
	 inhibhalfsecond()
	end
 
 --TODO timer between presses 

 elseif state=='display' then
	timer:tick()
	
	if timer.finished then
	  inittitle()
	  drawfunc=drawtitle
	  updatefunc=updatetitle
	  return
	
	end
	
-- on button press go to title
	j=polljoy()
	
	
	if love.keyboard.isDown("return") or fingeroneid~=nil or j.mainfire~=nil then
	  inittitle()
	  drawfunc=drawtitle
	  updatefunc=updatetitle
	  return
	end

-- on time out go to title
 end
end