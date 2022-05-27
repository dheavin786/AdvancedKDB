h:neg hopen hsym `$(raze[("localhost:",getenv[`tpPort])]) /connect to tickerplant
//system raze["l ",getenv[`advancedKDB],"/logging.q"]
system "l /home/local/FD/dheavin/AdvancedKDB/logging.q"
syms:`GOOG`APPL`IBM`MSFT`NVDA /stocks
prices:syms!58.96 123.65 98.40 110.56 132.45 /starting prices
n:3 /number of rows per update
flag:1 /generate 10% of updates for trade and 90% for quote
getmovement:{[s] rand[0.0001]*prices[s]} /get a random price movement
/generate trade price
getprice:{[s] prices[s]+:rand[1 -1]*getmovement[s]; prices[s]}
getbidPrice:{[s] prices[s]-getmovement[s]} /generate bid price
getaskPrice:{[s] prices[s]+getmovement[s]} /generate ask price
/timer function
.z.ts:{
  s:n?syms;
  $[0<flag mod 10;
    h(".u.upd";`quote;(n#.z.N;s;getbidPrice'[s];getaskPrice'[s];n?1000;n?1000));
    h(".u.upd";`trade;(n#.z.N;s;getprice'[s];n?999))];
  flag+:1; }
  
/trigger timer every 100ms
\t 1000
