
ck={}
ck.r=10
ck.g=200
ck.b=200

function loadfilter(fname)
	tofilter=love.image.newImageData( fname )

	-- lw=
	
	-- print
	

	todisp=love.image.newImageData(
						tofilter:getWidth(),
						tofilter:getHeight())

	for j=0,tofilter:getHeight()-1
	do
		for i=0,tofilter:getWidth()-1		
		do
			local r,g,b,a=tofilter:getPixel(i,j)
			if r==ck.r and g==ck.g and b==ck.b then
				todisp:setPixel(i,j,0,0,0,0)
			else
				todisp:setPixel(i,j,r,g,b,255)
			end
		end
	end
	
	return love.graphics.newImage(todisp)
	
end