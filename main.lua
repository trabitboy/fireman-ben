--gameplay: power up of water between levels?

-- update snake so that can be damaged even if blocked in change loop
-- still some initials blocked in walls
-- little snake block some time when reduced ( both horizontal and verts )
-- snake wall coll disables them from turning around
-- launch frame analysis by room to speed process up

-- blit blocking and ennemies with brown alpha when danger increases + sin wave frag shader

-- lvl 3 : snakes vert and hori, see sketchbook
-- update wall detect to track MOAR COLORS
-- at least 2 for snakes
-- make bump into wall increase danger a lot ? 
-- GIANT SNAKE AS BOSS?

-- WIP lvl3 content
-- WIP highscores invisible to players
-- WIP neo geo attract mode

--HIGH SCORES (time of completion) WIP
-- difficulty select 
	--animate
	--arrows
--lvl 3 encoding in progress; still tons of manual stuff
-- lvl 3 ; crash on 3rd or 4th screen
-- lvl 3 ; not properly scaled to fit
-- bouncing nega bens you need to avoid ( bounce on wall )
-- they could generate fire perdiodically or when they hit a wall
--TODO test sliding on screen change with end cases 
-- NEGABEN FOR LEVEL 3
-- giga skull with eyes filled with fire end of lvl 3 ?
--diamond hitbox


--dev
fullscreen=false
displayboxs=true
shader=true
fit=false
dbgstart=true

--play
-- fullscreen=true
-- displayboxs=false
-- shader=true
-- fit=true

function unittest()
 ret=loadfilter("pressbutton/pb1.png")
end


--VIES
--TRAIILERS

--radar

--lives screen with x
--animated fire on intro with truck

-- water splash unsatisfying
-- wrong start of first lev (room)
-- first boss death,anim
-- unwalkable first boss
-- keep multi directional spawn for boss 1

-- more fluid growth and progression of blue fire

--record trailer

-- make box pushable 

-- animated victory
-- animated game over

--test wall coll
--sliding hitbox with 4 points
--( you tend to stick to walls )

-- screen shake and flare on all fires when rank up explosion ?


--screen shake when flare

--lvl 1 learn fire

--boss 1 do not get touched

--lvl 2 combat spreading fire

-- lvl 3 prioritize target ?


-- three lives to restart at current level? score reset ?
-- video on lvl success ?

-- make box chain fire ?
-- make small boxes instead of holes ?
-- high score / table
-- video !!!!!!






--idea: blocks make fire splash, but holes in the ground don t stop it 
--( modify level 1)

--level 2 is about navigating holes in the ground






-- idea : fire that obscurs the view when flooded
-- display wall boxes as opaque areas with shaders
-- or from wall hitbox

-- fire varient transparency and wobble ( shader !!!! )

--boss that spawns fire devils ( stunned from fire devils; losing time ? )
--message to notify of door blocked because danger level (boss)
--boss level with alternative rule ( different rank )

-- brotaru biff feedback
-- time out game over
-- transition title screen ( down )
-- suppress tuto
-- time before push possible on title screen,
-- with visual hint 5 ( fat finger pressing button)
-- generally only one button for everything 
-- score /time
-- experiment with shaders on fires 

-- BELOZ COMPO COMMENTS
--jauge de fraicheur/ source de fraicheur

--water transparency and wobble 

--TODO new collhbs function that takes into account the special case of zoomed object (x, y are different)


-- joys=love.joystick.getJoysticks()
-- joy = nil 
-- if joys ~= nil then

 -- joy=joys[1]
 -- print("joy connected")
 -- print(joy)
-- end

-- is 1 2 or 3
rank=1
-- le rang change les comportements ennemis

rankcounter=0
seuil2=5
seuil3=10
seuil4=15
seuil5=20
maxrank=25


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
a5step=1
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
  -- end
   -- ww=480
  -- wh=600
  
  -- scrsx=ww/cvsw
  -- scrsy=wh/cvsh

  if fit then
   scrsx=ww/cvsw
   scrsy=wh/cvsh  
   love.window.setMode(ww,wh)
  else
   scrsx=1
   scrsy=1
   love.window.setMode(cvsw,cvsh)
  end
  
  if fullscreen then
   love.window.setFullscreen(true)
   xrtoff= 256 --TODO
  else
   xrtoff=0
  end
  --calculating offsetx for full screen_coords
  
  
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
 if shader then
 love.graphics.setShader(myShader) --draw something here
 end
 love.graphics.draw(vscreen,xrtoff,0,0,scrsx,scrsy)
 love.graphics.setShader()
end

-- require("events")
require("video")
require("joypoller")
require("loadfilter")

-- unittest()
-- print("return from unit test")
-- love.event.quit()

require("difficultyselect")
require("lives")
require("bigdevil")
require("devil")
require("devilbarrel")
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
require("negaben")
require('snake')
-- require("baddybullet")
require("maingameloop")
require("plybullet")
-- require("bg")
-- require("ghost")
require("drawgame")
-- require("boss")
-- require("touchsupport")
require('highscores')
require('timer')

print(currLvl)

sizewindow()


print(lvl)

-- for i=1, table.getn(lvl) do
 -- print(lvl[i])
-- end





function love.load()

 -- video = love.graphics.newVideo( 'test.ogv' )

--from stack overflow
-- vec2 onePixel = vec2(1.0, 1.0) / u_textureSize;
-- gl_FragColor = (
   -- texture2D(u_image, v_texCoord) +
   -- texture2D(u_image, v_texCoord + vec2(onePixel.x, 0.0)) +
   -- texture2D(u_image, v_texCoord + vec2(-onePixel.x, 0.0))) / 3.0;


	-- scanline=love.graphics.newShader[[
	-- extern vec2 textureSize;
	-- extern vec2 inputSize;
	-- extern vec2 outputSize;

	-- const float base_brightness = 0.95;
	-- const vec2 sine_comp = vec2(0.05, 0.15);

	-- vec4 effect(vec4 vcolor, Image texture, vec2 texture_coords, vec2 pixel_coords)
	-- {
		-- vec2 omega = vec2(3.1415 * outputSize.x * textureSize.x / inputSize.x, 2.0 * 3.1415 * textureSize.y);
		-- vec4 c11 = Texel(texture, texture_coords);

		-- vec4 scanline = c11 * (base_brightness + dot(sine_comp * sin(texture_coords * omega), vec2(1.0)));
		-- return clamp(vec4(scanline.rgb, c11.a), 0.0, 1.0);
	-- }
	-- ]]


  scanline=love.graphics.newShader[[
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
      vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
	  if( mod(screen_coords.y,2.0)<=0.5 ){
       return pixel * color*0.8;
	  
	  }else{
       return pixel * color*1.1;
	  }
    }
  ]]


  normal=love.graphics.newShader[[
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
      vec4 pixel = Texel(texture, texture_coords );//This is the current pixel color
	  
	  
	  
      return pixel * color;
    }
  ]]

  

  crt = love.graphics.newShader[[
   extern vec2 distortionFactor;
    extern vec2 scaleFactor;
    extern number feather;
    vec4 effect(vec4 color, Image tex, vec2 uv, vec2 px) {
      // to barrel coordinates
      uv = uv * 2.0 - vec2(1.0);
      // distort
      uv *= scaleFactor;
      uv += (uv.yx*uv.yx) * uv * (distortionFactor - 1.0);
      number mask = (1.0 - smoothstep(1.0-feather,1.0,abs(uv.x)))
                  * (1.0 - smoothstep(1.0-feather,1.0,abs(uv.y)));
      // to cartesian coordinates
      uv = (uv + vec2(1.0)) / 2.0;
      return color * Texel(tex, uv) * mask;
    }
	]]
  
  crt:send("scaleFactor",{1,1})
  crt:send("feather",0.02)
  crt:send("distortionFactor",{1.06, 1.065})
  
  -- myShader=crt
  -- myShader=normal
  myShader=scanline
 initjoy()

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
 
 ambiance=love.audio.newSource("contributed/exinguished_ambiance.wav","stream")
 ambiance:setVolume(0.5)
 ambiance:setLooping(true)
 love.audio.play(ambiance) 
 
 blank=love.graphics.newImage("blank.png")
 
 rank1=love.graphics.newImage("rank1.png")
 rank2=love.graphics.newImage("rank2.png")
 rank3=love.graphics.newImage("rank3.png")


 -- bb=love.graphics.newImage("bb.png")
 
 -- bg1=love.graphics.newImage("bg1.png")
 -- bg2=love.graphics.newImage("bg2.png")
 

 
 bullet=love.graphics.newImage("bullet.png")
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




	if dbgstart==nil then
	
		inittitle()
		drawfunc=drawtitle
		updatefunc=updatetitle
	else
		lives=1
		initdifselhard()
		startgame(5)
		drawfunc=drawgame
		updatefunc=updategame
	end	
  
end



	
	
function love.draw()
 drawfunc()
end

function love.update()
  updatefunc()
end

