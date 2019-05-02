# vim_plugin

use vimrc configuration your vim

please follow configuration down below, 3Q

## Install vim

    $ sudo apt-get install vim

## Clone project

    $ git clone https://github.com/m033010041/vim_plugin.git

## Backup your original vim config

if you dont have .vimrc, you can ignore this step

    $ cd
    $ cp .vimrc .vimrc.bak

## Make direction, and copy new vimrc to your home directory

    $ mkdir .vim
    $ cp /your_vim_plugin_directory/vimrc ~/.vim/.vimrc

## Clone Vundle project

    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

## Link the new vim configuration

    $ cd
    $ ln -s .vim/.vimrc .vimrc
    $ ll # to check your link file link successfully

## Use ":PluginInstall" to install plugins 

In the command line, type "vim" to open vim application

```
  " Installing plugins to /home/weintek-timmy/|[1:--NO NAME--1556776283]*[2:Vundle Installer]
  .vim/bundle                                 | MiniBufExplorer ⮀                            
. Plugin 'gmarik/vundle'                      |  1 
. Plugin 'Lokaltog/vim-powerline'             |~                                             
. Plugin 'kien/ctrlp.vim'                     |~                                             
. Plugin 'scrooloose/nerdtree'                |~                                             
. Plugin 'fholgado/minibufexpl.vim'           |~                                             
. Plugin 'msanders/snipmate.vim'              |~                                             
. Plugin 'Shougo/neocomplcache'               |~                                             
. Plugin 'majutsushi/tagbar'                  |~                                             
. Plugin 'godlygeek/tabular'                  |~                                             
. Plugin 'hsitz/VimOrganizer'                 |~                                             
. Plugin 'plasticboy/vim-markdown'            |~                                             
. Plugin 'vim-scripts/Conque-Shell'           |~                                             
. Plugin 'peterhoeg/vim-qml'                  |~                                             
. Plugin 'editorconfig/editorconfig-vim'      |~                                             
* Helptags                                    |~                                             
                                              |~                                             
```
and use ":q" to quit application. And now you can enjoy it !!

# editorconfig tutorial

editorconfig 是一個針對不同副檔名而進行自動修改格式的檔案

在 C 以及 C++ 語言中，其實針對 tab 所允許的空白格數是有規定的

C  : 8 space / 1 tab

C++: 4 space / 1 tab

如果為了一個可能會同時編輯到的檔案，一直為格式所煩惱，這不是我期望的

因此此檔案支援了.c .cpp 等檔案的設定格式

設定方面

你不用擔心，因為 editorconfig 的 plugin 已經在上述的設定當中幫您預設好

您只要將此檔案放到你要修改的該目錄下面

並將檔名修改成 .editorconfig 即可

例如 ~/Documents/project/test/ 中有兩個檔案，分別是 test1.c 以及 test2.cpp

若使用一般的 vim 進行內容撰寫

由於之前不會判斷副檔名，而造成全部格式一致的情況

    $ cp /your_vim_plugin_directory/editorconfig ~/Documents/project/test/.editorconfig

即可完成設定

