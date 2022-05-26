table:.z.x 0
fp:.z.x 1
port:.z.x 2

/("NSJJ";enlist csv) 0: read0 hsym `$fp

$[(`$table)=`trade;trade:("NSFJ";enlist ",") 0: read0 hsym `$fp;trade:"notset"];
$[(`$table)=`quote;quote:("NSFFJJ";enlist ",") 0: read0 hsym `$fp;quote:"notset"];

h::hopen `$raze[(":localhost:",port)]

if[(`$table)=`trade;h(`.u.upd;`trade;value flip trade)];
if[(`$table)=`quote;h(`.u.upd;`quote;value flip quote)];

0N!"CSV rows successfully added to the tickerplant";

exit 0
