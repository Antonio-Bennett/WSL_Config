# WSL Configuration  
  
## Structure  
  
Has Oh My Fish and fish configurations as well as neovim config which is the most work  
  
### Nvim Folder  
  
The init.lua file in the main contains the calls to each required lua in the lua folder  
Ex. *****require('keymappings')** calls the corresponding file in the lua folder  
  
In the lua folder are subfolders containing init.lua files.  
This is because we can then require the folder names in the main init.lua file instead  
of **require('foldername/init.lua')  
  


