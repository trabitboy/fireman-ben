--jauge de fraicheur/ source de fraicheur


--gplay variables
firezoominc=0.1
minfirezoom=0.2
maxfirezoom=3
waterzoominc=-0.1

--zoom step to create new small fires
firestep=1
childinhibcycles=2000

fireinctimer=0
fireincchg=120

tickupref=45
livingfirebonus=0.01


waterreward=1

--can be u d l r
facing="d"
ydir=1
xdir=0

bulletinhibref=8

--util
function tbllngth(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

animstep=1
animclk=0
animchge=10



bulletspeed=2

cvsw=640
cvsh=480

pfx=0
pfy=0
pfw=540
pfh=480

ggx=540
ggy=0
ggw=100
ggh=480

plyspeed=3

score = 0
multiplier=1

-- is 1 2 or 3
rank=1
-- le rang change les comportements ennemis

--how much each pickup influences counter
rankstep=4
--chaque pickup augmente le rang
rankcounter=0
seuil2=5
seuil3=10
seuil4=15
seuil5=20
maxrank=25



vscreen=love.graphics.newCanvas(cvsw,cvsh)

ply={}

android = false
if  love.system.getOS() == 'Android' then
  android = true
end
  -- --debug
-- android = true


function sizewindow()

	
	
  dw,dh=love.window.getDesktopDimensions()
  print(dh)
  print(dw)
  wh=dh-64
  -- wh=480
  -- print(wh)
  --wh=dh
  print(wh)
  -- if android==true then
   ww=wh*4/3
  -- else
   -- ww=0.75*wh
  -- end
  print(ww)
  love.window.setMode(wh,ww)
 -- love.window.setMode(640,480)
  -- if android == true then
   -- scrsx=wh/cvsw
   -- scrsy=ww/cvsh
  -- else
   scrsx=ww/cvsw
   scrsy=wh/cvsh  
  -- end
   -- ww=480
  -- wh=600
  
  -- scrsx=ww/cvsw
  -- scrsy=wh/cvsh
  love.window.setMode(ww,wh)
 end

function rdrvscreen()
 love.graphics.setCanvas()
 -- love.graphics.rotate(-math.pi / 2)
 -- if android == true then
  -- love.graphics.translate(ww/2, wh/2)
  -- love.graphics.rotate(math.pi / 2)
  -- love.graphics.translate(-ww/2, -wh/2) 
 -- end
 -- if android == true then
  -- love.graphics.translate(ww/2, wh/2)
  -- love.graphics.rotate(math.pi / 2)
  -- love.graphics.translate(-wh/2, -ww/2) 
 -- end
 love.graphics.draw(vscreen,0,0,0,scrsx,scrsy)
end

-- require("events")
require("loadfilter")
require("death")
require("fx")
require("fireman")
require("exit")
require("box")
require("fire")
require("lvl")
require("coll")
require("gameover")
require("tuto")
require("title")
require("victory")
-- require("baddybullet")
require("maingameloop")
require("plybullet")
-- require("bg")
-- require("ghost")
require("drawgame")
-- require("boss")
require("touchsupport")

print(levels)
print(currLvl)

sizewindow()


print(lvl)

-- for i=1, table.getn(lvl) do
 -- print(lvl[i])
-- end





function love.load()

 -- boss=love.graphics.newImage("boss.png")
 scoremask=love.graphics.newImage("scoremask.png")
 title=love.graphics.newImage("title.bmp")
 gameover=love.graphics.newImage("gameover.bmp")
 victory=love.graphics.newImage("victory.bmp")

 --default 
 finalpic=gameover
 
 
 rankup = love.audio.newSource("contributed/exinguished_explosion.wav", "static")
 rankdown = love.audio.newSource("sounds/rankdownshort.wav", "static")
 
 piou = love.audio.newSource("contributed/exinguished_water_throw.wav", "static")
 -- miom = love.audio.newSource("sounds/miom.wav", "static")
 fire = love.audio.newSource("contributed/exinguished_fire_loop.wav", "static")
 -- aie=love.audio.newSource("sounds/aieshort.wav", "static")
 extinction=love.audio.newSource("contributed/exinguished_fire_extinguish.wav","static")
 
 ambiance=love.audio.newSource("contributed/exinguished_ambiance.wav")
 ambiance:setVolume(0.5)
 ambiance:setLooping(true)
 love.audio.play(ambiance) 
 
 blank=love.graphics.newImage("blank.png")
 
 rank1=love.graphics.newImage("rank1.png")
 rank2=love.graphics.newImage("rank2.png")
 rank3=love.graphics.newImage("rank3.png")

 xpl=love.graphics.newImage("explosion.png")

 -- bb=love.graphics.newImage("bb.png")
 
 -- bg1=love.graphics.newImage("bg1.png")
 -- bg2=love.graphics.newImage("bg2.png")
 
 devil=love.graphics.newImage("devil.png")

 pill=love.graphics.newImage("pill.png")
 
 ghost=love.graphics.newImage("ghost.png")
 bullet=love.graphics.newImage("bullet.png")
 image=ghost:getData()
 -- local image = love.image.newImageData( 'path/to/Image.png' )
 -- local pixels = {}
  -- for x = 1, image:getWidth() do
    -- for y = 1, image:getHeight() do
        -- -- Pixel coordinates range from 0 to image width - 1 / height - 1.
        -- local pixel = image:getPixel( x - 1, y - 1 )
		-- -- print(pixel)
        -- pixels[#pixels + 1] = pixel
    -- end
  -- end
 
 end

x=100


drawfunc=drawtitle
updatefunc=updatetitle

function love.draw()
 drawfunc()
end

function love.update()
  updatefunc()
end

