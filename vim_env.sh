#!/bin/bash

# 创建 Vim 目录结构
mkdir -p ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

# 安装 vim-plug 插件管理器
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 初始化 vim-plug
vim +PlugInstall +qall

# 使用 vim-plug 安装插件
vim +'PlugInstall' +qall

# 安装 YouCompleteMe 插件
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe
cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive

# 安装 YouCompleteMe 的依赖项
sudo apt-get install -y build-essential cmake python3-dev python-dev ctags gcc g++ clang libclang-dev

# 编译 YouCompleteMe
./install.py --clangd-completer

# 安装 universal-ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=$HOME/tools/ctags
make -j && make install

# 添加 ctags 到 PATH
echo 'export PATH=$HOME/tools/ctags/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# 更新 YouCompleteMe 的 .ycm_extra_conf.py
cp ~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py ~/.vim/

# 安装 YCM-Generator
cd ~/.vim/plugged
git clone https://github.com/rdnetto/YCM-Generator.git

# 安装其他插件
vim +PlugUpdate +qall

# 清理不再需要的插件
vim +PlugClean +qall

# 应用配置
echo "Vim 配置完成。请重新启动 Vim 以应用更改。"
