#!/bin/bash

# finding all the folers which are git
find /home/ -name .git -print0  | while read -d $'\0' path
do

     abs_path=$(echo $path | cut -f1 -d".")  # getting the absolute path
     #echo $abs_path
     REPOSITORIES=$abs_path

if [ -d "$REPOSITORIES/$REPO" ]  # check in reposiories/
  then
    echo "Updating $REPOSITORIES/$REPO at `date`"
    if [ -d "$REPOSITORIES/$REPO/.git" ] # checking if this is the git dir
     then
       cd "$REPOSITORIES/$REPO"  # cd into the dir
       git status # getting the git status
       echo "Fetching"
       git fetch   #fetching the git
       echo "checking if Pull needed"
       change=0
       git status -uno | grep -q 'Your branch is behind' && chnage=1 # checking if pull is needed
       if [ $change -eq 1 ] # if yes then make pull
          then
            git pull
            echo "pulled successfully"
         else
            echo " your branch is Up-To-Date"
       fi
    else
      echo "Skipping because it doesn't look like it has a .git folder."
    fi
    echo "Done at `date`"
   echo
  fi
done
