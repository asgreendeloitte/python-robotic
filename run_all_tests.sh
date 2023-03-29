#!/bin/bash


# created by Martin Hrusovsky
# v1.0 
# script will run all robot scrits from proivided folder
# if script fails it will run it in retry for X times with delay Y s



if (( $# < 5 ))
then
    printf "%b" "Error. Not enough arguments.\n" >&2
    printf "%b" "usage: $0.sh <Result dir> <Tests script dir> <User Name> <Password> <URL> \n" >&2
    exit 1
fi

Results=$1
Scripts=$2
UserName=$3
Passsword=$4
URL=$5
#DATE=$(date +"%Y%m%d%H%M")
mkdir -p test-results

function fail {
  echo $1 >&2
  mv $Results/X_* test-results/
  exit 1
}

function retry {
  local n=1
  local max=5
  local delay=5
  while true; do
    "$@" && break || {
      if [[ $n -lt $max ]]; then
        ((n++))
        echo "Command failed. Attempt $n/$max:"
        rm -rf $Results/*
        sleep $delay;
      else
        fail "The command has failed after $n attempts."
      fi
    }
  done
}

#robot  -T -d  Results TestSuite/SmokeTest_Agent_TestEnv/SMK_02_Contact_Tracing_Agent.robot

for robotScript in $Scripts/*.robot; do 
  xunitfile=$(basename -- "$robotScript")
  xunitfile="X_${xunitfile%.*}"
  retry robot -v Username:$UserName -v Password:$Passsword -v SITEURL:$URL -x $xunitfile -T -d $Results $robotScript
  mv $Results/* test-results/
done
