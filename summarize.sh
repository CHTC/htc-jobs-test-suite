#!/bin/bash

echo '******* OUTPUT FILES *******'
for d in `find ./*/ -name "*.out"`
do
 echo '---------'
 echo $d
 cat $d
 echo ' '
done

echo '******* ERROR FILES *******'
for d in `find ./*/ -name "*.err"`
do
 echo '---------'
 echo $d
 cat $d
 echo ' '
done


