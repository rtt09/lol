#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth-asia1.nanopool.org:9999
WALLET=0x083B5329be079Fcf208a8F3DA141184D4dF44Cf0.lolMinerWorker

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
