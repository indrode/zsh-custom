#!/bin/sh

# checks OUTGOING directory for files and scp them to TARGET_HOST's incoming directory
# clean up after completion

# run: bash "$ZSHCUSTOM/scripts/zshcustom_watch_outgoing.sh" &

# TODO: add lock file, run as daemon

check() {
    while :
    do
      chsum1=`find "$OUTGOING" -type f -exec ls {} \; | md5`
      chsum2=$chsum1
          
      while [ "$chsum1" == "$chsum2" ]
      do
          sleep 5
          chsum2=`find "$OUTGOING" -type f -exec ls {} \; | md5`
      done

      echo "[`date -v1m -v+1y`] Found changes in outgoing folder ($chsum2)" >> /var/log/zshcustom.log
      scp "$OUTGOING"/*.* $TARGET_HOST:~/Incoming 2> /var/log/zshcustom.log
      echo "[`date -v1m -v+1y`] Moved to $TARGET_HOST:~/Incoming" >> /var/log/zshcustom.log
      cd "$OUTGOING" && rm -f *.* | tee /var/log/zshcustom.log
      echo "[`date -v1m -v+1y`] Clean up succesfull" >> /var/log/zshcustom.log
      cd /Applications && ./terminal-notifier.app/Contents/MacOS/terminal-notifier -message "File moved to $TARGET_HOST." >> /var/log/zshcustom.log
    done
}

check $*
