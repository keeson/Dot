#!/usr/bin/env bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /bin/zsh

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

cur_dir=$(cd `dirname $0`; pwd)
cd $cur_dir
function rock()
{
    file_name=$1
    rock_name=$file_name
    unix_type=`uname`
    if [ $rock_name == *"_Linux" ] || [ $rock_name == *"_Darwin" ]
    then
        suffix=${rock_name##*_}
        if [[ $unix_type != $suffix ]]
        then
            return
        fi
        rock_name=${rock_name%_*}
    fi
    cmd="rm ~/.$rock_name"
    echo $cmd
    eval $cmd
    cmd="ln -s $cur_dir/$file_name ~/.$rock_name"
    echo $cmd
    eval $cmd
}

filelist=`ls .`
for file in $filelist
do
    if [[ $file =~ \.sh$ ]]
    then
        continue
    fi
    if [[ $file =~ \.md$ ]]
    then
        continue
    fi
    rock $file
done
