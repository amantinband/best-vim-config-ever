# BEST VIM CONFIGURATION EVER
### want your vim to look exactly like this:  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/playing_around.gif)

##### with all the best plugins like nerd-tree  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/nerdtree.gif)

##### and ctrl-p  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/ctrlp.gif)

##### and fugitive 
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/fugitive.gif)

##### and googles search-index  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/search.gif)

##### and of course airline's legendary power-line:  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/buffers.gif)

##### and if thats not enough there are a couple of beautiful shtiks like marks for trailing white spaces  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/extra_spaces.gif)

##### and function folds  
![Alt Text](https://github.com/mantinband/best-vim-config-ever/blob/master/gifs/folds.gif)


## want your vim to look exactly the same ? 
 simply place .vimrc in your ~, copy & paste following commands and you're set!  


#### plugins:  

1. pathogen vim:  
     ` mkdir -p ~/.vim/autoload ~/.vim/bundle && \  
     curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim `  

2. nerdtree vim:  
     git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree  

3. ctrlp:  
     cd ~/.vim/bundle && git clone https://github.com/kien/ctrlp.vim  

4. fugitive:  
     cd ~/.vim/bundle && git clone https://github.com/tpope/vim-fugitive  

5. airline:  
     git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline  

6. google-searchindex:  
     cd ~/.vim/bundle && git clone https://github.com/google/vim-searchindex.git  

7. install fonts:  
     git clone https://github.com/powerline/fonts.git --depth=1  
     cd fonts  
     ./install.sh  
     cd ..  
     rm -rf fonts  
     fc-cache -vf  

8. persistent undo:  
     mkdir ~/.vim/undo  

9. you complete me:  
     cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe  
     cd YouCompleteMe && python ./install.py  

10. grep:  
    cd ~/.vim/bundle && git clone https://github.com/yegappan/grep  

fonts:  
cp -rf ~amichaim/.fonts ~/  
cp -rf /labhome/amichaim/.config/fontconfig ~/  
