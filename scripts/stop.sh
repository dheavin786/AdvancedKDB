#!/bin/bash

export TPON=$(ps -ef | grep -v grep |grep "tick.q"|wc -l)
export RTQON=$(ps -ef | grep -v grep |grep "rTQ.q"|wc -l)
export CEPON=$(ps -ef | grep -v grep |grep "cep.q"|wc -l)
export FEEDON=$(ps -ef | grep -v grep |grep "feed.q"|wc -l)
export RAGGON=$(ps -ef | grep -v grep |grep "rAGG.q"|wc -l)

export TPPORT=$(ps -ef | grep -v grep |grep "tick.q"|awk '{print $2}')
export RTQPORT=$(ps -ef | grep -v grep |grep "rTQ.q"|awk '{print $2}')
export CEPPORT=$(ps -ef | grep -v grep |grep "cep.q"|awk '{print $2}')
export FEEDPORT=$(ps -ef | grep -v grep |grep "feed.q"|awk '{print $2}')
export RAGGPORT=$(ps -ef | grep -v grep |grep "rAGG.q"|awk '{print $2}')

if [[ "$TPON">"0"  ]]
then
          echo "The Tickerplant is running, would you like to stop it? (y/n)"
          read tpbool
                if [ "$tpbool" = "y" ]; then
                kill -9 $TPPORT
                echo "The tickerplant has been STOPPED"
                fi
else
  echo "The tickerplant is NOT running"
fi

if [[ "$RTQON">"0"  ]]
then
          echo "The Trade-Quote RDB is running, would you like to stop it? (y/n)"
          read rtqbool
                if [ "$rtqbool" = "y" ]; then
                kill -9 $RTQPORT
                echo "The Trade-Quote RDB has been STOPPED"
                fi
else
  echo "The Trade-Quote RDB is NOT running"
fi

if [[ "$CEPON">"0"  ]]
then
          echo "The CEP is running, would you like to stop it? (y/n)"
          read cepbool
                if [ "$cepbool" = "y" ]; then
                kill -9 $CEPPPORT
                echo "The CEP has been STOPPED"
                fi
else
  echo "The CEP is NOT running"
fi

if [[ "$RAGGON">"0"  ]]
then
          echo "The Aggregation RDB is running, would you like to stop it? (y/n)"
          read raggbool
                if [ "$raggbool" = "y" ]; then
                kill -9 $RAGGPORT
                echo "The Aggregation RDB has been STOPPED"
                fi
else
  echo "The Aggregation RDB is NOT running"
fi

if [[ "$FEEDON">"0"  ]]
then
          echo "The Feedhandler is running, would you like to stop it? (y/n)"
          read feedbool
                if [ "$feedbool" = "y" ]; then
                kill -9 $FEEDPORT
                echo "The Feedhandler has been STOPPED"
                fi
else
  echo "The Feedhandler is NOT running"
fi
