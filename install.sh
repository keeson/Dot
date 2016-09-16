#!/bin/sh
cur_dir=$(cd `dirname $0`; pwd)
filelist=`ls $cur_dir/`
for file in $filelist
do
    if [[ $file =~ \.sh$ ]]
    then
        continue
    fi
    cmd="rm ~/.$file"
    echo $cmd
    eval $cmd
    cmd="ln -s $cur_dir/$file ~/.$file "
    echo $cmd
    eval $cmd
done
