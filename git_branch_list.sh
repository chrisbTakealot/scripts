#!/bin/sh

echo "Git branch per directory:"
echo "========================="
echo

for DIR in * #$(find . -type d)
do
  if [ -d ${DIR} ]; 
  then

    echo "Checking Directory: ${DIR}"    

    GIT_PARAMS=" --git-dir=${DIR}/.git --work-tree=${DIR} "
    GIT_PARAMS=" --git-dir=${DIR}/.git "

    BRANCH=$(git ${GIT_PARAMS} rev-parse --abbrev-ref HEAD)

    echo "Current Branch is: ${BRANCH}"

    
    echo

  fi

done
