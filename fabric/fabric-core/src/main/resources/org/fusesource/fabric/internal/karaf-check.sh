function karaf_check() {
   KARAF_HOME=$1
   INSTANCES_FILE=$KARAF_HOME/instances/instance.properties
   for i in `seq 1 60`;
     do
       if [ ! -f $INSTANCES_FILE ]; then
         sleep 2
       fi
     done
   if [ -f $INSTANCES_FILE ]; then
     PID=`cat $INSTANCES_FILE | grep "item.0.pid" | awk -F "=" '{print $2}'`
     if ps -p $PID > /dev/null; then
       echo "Fabric is started successfully"
     else
       echo "Command Failed: Karaf process ($PID) is not running"
     fi
   else
     echo "Command Failed:Could not find Karaf instance.properties"
   fi
}