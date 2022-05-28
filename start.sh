#!/usr/bin/bash
#nohup q tick.q sym . -p 5011 1>>tick.log 2>&1 &
#nohup q tick/feedhandler.q 1>>feed.log 2>&1 &
#nohup q tick/rdbTQ.q localhost:5011 1>>newestTQ2.log 2>&1 &
#nohup q tick/cep.q localhost:5011 1>>cep.log 2>&1 &
#nohup q tick/rdbAGG.q localhost:5011 1>>rAGG.log 2>&1 &


source ./config.sh
echo "Enter y to run the Tickerplant, (y/n)"
read tickbool

if [ "$tickbool" = "y" ]; then
        nohup $q $advancedKDB/tick.q sym . -p $tpPort 1>>$advancedKDB/logs/tick.log 2>&1 &
fi

echo "Enter y to run the Trade/Quote RDB (y/n)?"
read rTQbool

if [ "$rTQbool" = "y" ]; then
    nohup $q $advancedKDB/tick/rTQ.q localhost:$tpPort 1>>$advancedKDB/logs/rdbTQ.log 2>&1 &
fi

echo "Enter y to run the Aggregation RDB (y/n)?"
read rAGGbool

if [ "$rAGGbool" = "y" ]; then
        nohup $q $advancedKDB/tick/rAGG.q localhost:$tpPort 1>>$advancedKDB/logs/rdbAGG.log 2>&1 &
fi

echo "Enter y to run the Start CEP (y/n)?"
read cepbool

if [ "$cepbool" = "y" ]; then
    nohup $q $advancedKDB/tick/cep.q localhost:$tpPort 1>>$advancedKDB/logs/cep.log 2>&1 &
fi

echo "Enter y to run the Mock Feedhandler (y/n)?"
read feedbool

if [ "$feedbool" = "y" ]; then
        nohup $q $advancedKDB/tick/feedhandler.q 1>>$advancedKDB/logs/feed.log 2>&1 &
fi
