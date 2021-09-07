#!/bin/bash
echo_red(){
    echo -e "\033[31m$1\033[0m"
}
echo_green(){
    echo -e "\033[32m$1\033[0m"
}
help() {
    echo_red "Usage: $0 start|stop|restart service_name"
}
checkCommand() {
    if [ $# -lt 2 ]; then
        help
        exit 1
    fi
}
getPID(){
    PID=`ps -ef |grep -w $XDAG_JARNAME |grep -v grep |awk '{print $2}'`
}
init(){
    SERVICE_NAME=$2
    APP_NAME="$(basename $SERVICE_NAME)"
    XDAG_VERSION="0.4.5"
    XDAG_JARNAME="xdagj-${XDAG_VERSION}-shaded.jar"
}

start(){
    getPID
    if [ ! -n "$PID" ]; then
        current_time=`date "+%Y-%m-%d %H:%M:%S"`
        current_timestamp=`date -d "$current_time" +%s`
        echo_green "starting $APP_NAME..."
	# run TODO
	screen -dmS test bash -c "./xdag.sh -t"  
	echo "done"	     
    else
          echo_green "$APP_NAME is already running PID: $PID"
    fi
}
stop(){
    getPID
    if [ ! -n "$PID" ]; then
        echo_red "$APP_NAME not running"
    else
        echo_green "will stop $APP_NAME..."
        kill $PID
        for i in `seq 1 $CHECK_SECONDS`
        do
            getPID
            if [ -n "$PID" ]; then
                sleep 1
            else
                if [ -d "${TEMP_DIR}" ]; then
                    rm -rf "${TEMP_DIR}"
                fi
                echo_green "$APP_NAME stoped!"
            return
            fi
          done
          getPID
          if [ -n "$PID" ]; then
            echo_red "after $CHECK_SECONDS seconds, service is still running, will kill -9"
            kill -9 $PID
          fi
          if [ -d "${TEMP_DIR}" ]; then
              rm -rf "${TEMP_DIR}"
          fi
          echo_green "$APP_NAME stoped!"
    fi
}
restart(){
    stop
    start
}
init $*
case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart)
        restart
        ;;
    *)
        echo_red "unsupported command:'$1'"
        help
esac
