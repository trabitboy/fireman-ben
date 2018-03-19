

function love.load()
 love.window.setMode(640,480)

 pic=love.image.load("fire/fire1.png")

end


function love.draw()
	love.graphics.draw(pic,0,0)

end