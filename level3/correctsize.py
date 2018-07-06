#copy level frames from zzn workbook
#renames
#TODO calculate forbidden areas and save as lua source
import pygame
import os
import shutil
from pygame.locals import *

wb="c:/Users/thomas/Dropbox/current_zazanim_projects/firemanben/"
tgt="./"

tomove=[
    {'i':"133",'t':"1d"},
    {'i':"134",'t':"1dw"},
    {'i':"131",'t':"1c"},
    {'i':"132",'t':"1cw"},
    {'i':"129",'t':"2c"},
    {'i':"130",'t':"2cw"},
    {'i':"127",'t':"3c"},
    {'i':"128",'t':"3cw"},
    {'i':"125",'t':"3b"},
    {'i':"126",'t':"3bw"},
    {'i':"123",'t':"3a"},
    {'i':"124",'t':"3aw"},
    {'i':"121",'t':"4a"},
    {'i':"122",'t':"4aw"},
    {'i':"119",'t':"5a"},
    {'i':"120",'t':"5aw"},
    ]

for obj in tomove:
    print(obj)
    src=pygame.image.load(wb+"frame"+obj['i']+'.bmp')
    scaled =pygame.transform.scale(src,(540,480))
    croped=pygame.Surface((640,480))
    croped.blit(scaled,(0,0))
    pygame.image.save(croped,wb+'frame'+obj['i']+'.bmp')
