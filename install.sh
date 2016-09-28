#!/bin/sh
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
    cmd="ln -s $file_name ~/.$rock_name"
    echo $cmd
    eval $cmd
}

cur_dir=$(cd `dirname $0`; pwd)
cd $cur_dir
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
