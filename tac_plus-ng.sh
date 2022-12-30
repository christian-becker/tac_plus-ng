#!/bin/bash
# Script to manage "tac_plus-ng" service

case "$1" in
  create)
    docker run --name tac_plus-ng -p 49:49 -v $(pwd)/etc/tac_plus-ng.cfg:/usr/local/etc/tac_plus-ng.cfg -v $(pwd)/log/:/var/log/ -d -t --restart=always christianbecker/tac_plus-ng
    ;;
  start)
    docker start tac_plus-ng
    ;;
  status)
    docker stats tac_plus-ng
    ;;
  restart)
    docker restart tac_plus-ng
    ;;
  stop)
    docker stop tac_plus-ng
    ;;
  remove)
    docker rm tac_plus-ng
    ;;
  *) 
    echo "Usage: $0 {create|start|status|restart|stop|remove}"
    exit 1
    ;;
esac

exit 0
