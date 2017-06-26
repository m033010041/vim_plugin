# vim_plugin
use vimrc configuration your vim

please follow configuration down below, 3Q

## Install vim

    $ sudo apt-get install vim

## Clone this project

    $ git clone https://github.com/m033010041/vim_plugin.git

## backup your original vim config

if you dont have .vimrc, you can ignore this step

    $ cd
    $ cp .vimrc .vimrc.bak

## make direction, and copy new vimrc to your home directory

    $ mkdir .vim
    $ cp /your_vim_plugin_directory/vimrc ~/.vim/.vimrc

## link the new vim configuration

    $ cd
    $ ln -s .vim/.vimrc .vimrc
    $ ll # to check your link file link successfully

