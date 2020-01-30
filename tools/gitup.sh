#!/bin/bash

gitUpdate()
{
   if [ -d $1 ]; then
      if [ -d $1/.git ]; then
         pushd $1 > /dev/null
         echo "============================================ $1"
         git up
         git status | grep -v "# On branch" | grep -v "nothing to commit, working directory clean"
         git stash list
         popd  > /dev/null
      fi
   fi
}

for D in `find . -type d -name .git`
do
   dirName=`echo $D | sed s/.git$//`
   gitUpdate $dirName
done

