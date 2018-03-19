

function updategameover()
 if love.keyboard.isDown("return") or fingeroneid~=nil  then
  
  drawfunc=drawtitle
  updatefunc=updatetitle
 end


end



function drawgameover()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.graphics.draw(finalpic,0,0)
 -- love.graphics.print("game over!",200,200)
 -- love.graphics.print("your score",200,300)

 -- love.graphics.print("you have no real score you couldn't keep them calm !",20,540)

 -- love.graphics.print(score,200,570)
 love.graphics.print("press ENTER",200,600)

 rdrvscreen()


end 