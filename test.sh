#! /bin/bash

#find . -name '*.html' > list.txt

list=./list.txt

replace_from1=hello
replace_to1=test

replace_from2=e
replace_to2=t

for target in `cat ${list}`; do
  #bkup
  echo ----------start ${target}----------
  echo backup ${target}
  cp --parent ${target} ./bkup

  #getfilename
  file_name=`echo ${target} | sed 's!^.*/!!'`
  echo filename=${file_name}

  #conv1
  conv1=./tmp/${file_name}_conv1
  echo convert1 ${target} ${conv1}
  cat ${target} | perl -0 -pe "s/${replace_from1}/${replace_to1}/s" > ${conv1} 
  
  conv2=./tmp/${file_name}_conv2
  echo convert2 ${conv1} ${conv2}
  cat ${conv1} | perl -0 -pe "s/${replace_from2}/${replace_to2}/s" > ${conv2}
  
  echo copy${conv2} ${target}
  cp ${conv2} ${target}
  
  echo ----------end ${target}----------
done
