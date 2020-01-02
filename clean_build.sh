#! /usr/bin/env bash 


if [ -d "./bin" ]
then
    rm -f -r bin 
fi 

if [ -d "./mod" ]
then 
    rm -f -r mod 
fi 

if [ -d "./obj" ]
then 
    rm -f -r obj 
fi 

if [ -d "./ans" ]
then 
    rm -f -r ans 
fi 

rm -f src/euler/euler_interface.f90
rm -f src/euler/euler_prob_api.f90

echo "Build files cleaned."
