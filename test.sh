#!/bin/bash

export TPON=$(ps -ef | grep -v grep |grep "tick.q"|wc -l)
export TPID=$(ps -ef |grep -v grep |grep "tick.q" |awk '{ print $2 }' )

if [[ "$TPON">"0"  ]]
then
  echo "Tickerplant is running. PID: "$TPID
else
  echo "The tickerplant is NOT running"
fi

export RTQON=$(ps -ef | grep -v grep |grep "rTQ.q"|wc -l)
export RTID=$(ps -ef |grep -v grep |grep "rTQ.q" |awk '{ print $2 }' )

if [[ "$RTQON">"0"  ]]
then
  echo "The Trade-Quote RDB is running. PID:  "$RTID
else
  echo "The Trade-Quote RDB is NOT running"
fi

export CEPON=$(ps -ef | grep -v grep |grep "cep.q"|wc -l)
export CEPID=$(ps -ef |grep -v grep |grep "cep.q" |awk '{ print $2 }' )

if [[ "$CEPON">"0"  ]]
then
  echo "The CEP is running. PID: "$CEPID
else
  echo "The CEP is NOT running"
fi

export FEEDON=$(ps -ef | grep -v grep |grep "feed.q"|wc -l)
export FEEDID=$(ps -ef |grep -v grep |grep "feed.q" |awk '{ print $2 }' )

if [[ "$FEEDON">"0"  ]]
then
  echo "The feedhandler is running. PID: "$FEEDID
else
  echo "The feedhandler is NOT running"
fi


export RAGGON=$(ps -ef | grep -v grep |grep "rAGG.q"|wc -l)
export RAGGID=$(ps -ef |grep -v grep |grep "rAGG.q" |awk '{ print $2 }' )


if [[ "$RAGGON">"0"  ]]
then
  echo "The Aggregation RDB is running. PID: "$RAGGID
else
  echo "The Aggregation RDB is NOT running"
fi
