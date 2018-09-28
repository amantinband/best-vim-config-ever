# BEST VIM CONFIGURATION EVER

### simply place .vimrc in your ~, copy & paste following commands and you're set!


plugins:  

1. pathogen vim:  
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim  

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

8. persistent undo:  
    mkdir ~/.vim/undo  


fonts:  
cp -rf ~amichaim/.fonts ~/  
cp -rf /labhome/amichaim/.config/fontconfig ~/  
