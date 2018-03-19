

function updatevictory()
 if love.keyboard.isDown("return") or fingeroneid~=nil  then
  drawfunc=drawtitle
  updatefunc=updatetitle
 end


end



function drawvictory()
 love.graphics.setCanvas(vscreen)
 love.graphics.clear()
 love.draw(victory,0,0)
 love.graphics.print("YOU DID IT!",200,470)
 -- love.graphics.print("your score",200,300)

 love.graphics.print("YOU FED LIKE A PIGGIE keeping them calm !",20,500)

 love.graphics.print("your awesome score :",200,540)
 love.graphics.print(score,200,560)
 rdrvscreen()


end 