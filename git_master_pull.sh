#!/bin/sh

for DIR in * #$(find . -type d)
do
  if [ -d ${DIR} ]; 
  then

    echo "Checking Directory: ${DIR}"    

    GIT_PARAMS=" --git-dir=${DIR}/.git --work-tree=${DIR} "
    GIT_PARAMS=" --git-dir=${DIR}/.git "

    BRANCH=$(git ${GIT_PARAMS} rev-parse --abbrev-ref HEAD)

    echo "Current Branch is: ${BRANCH}"

    if [ "${BRANCH}" = "master" ];
    then
    	
	echo "Will pull from origin"

	git ${GIT_PARAMS} pull origin master

    else

        echo "Skipping: Not master branch"
   
    fi

    echo

  fi

done
