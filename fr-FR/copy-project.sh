#!/bin/bash

project=$1

if [[ "${project}" == "" ]]; then
	echo "copy-project.sh project"
	exit 1
fi
fr_dir=./${project}
en_dir=../en-GB/${project}
if [ -f ${fr_dir} ]; then
	echo "${fr_dir} existe déjà"
	exit 2
fi
mkdir -p ${fr_dir}

cp -R ${en_dir}/* ${fr_dir}


find ${fr_dir} -type f -name '*.md' -exec sed -f replace-project.sed -i {} \;
