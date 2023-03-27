# Fetch only "real time" from time command
TIMEFORMAT=%R

# How many tests should be done
EXECUTIONS=100

# Compile both programs
go build montecarlo.go
kotlinc Montecarlo.kt -d Montecarlo.jar

GO_TIME=0.0
KOTLIN_TIME=0.0
for i in `seq 1 $EXECUTIONS`
do
  # Ignore program's output, add "real time" spent with other executions using bc
  GO_TIME=$(echo "$GO_TIME + $(time ( ./montecarlo ) 2>&1 1>/dev/null )" | bc)
  KOTLIN_TIME=$(echo "$KOTLIN_TIME + $(time ( java -jar Montecarlo.jar ) 2>&1 1>/dev/null )" | bc)
done

echo "$GO_TIME/$EXECUTIONS" | bc -l
echo "$KOTLIN_TIME/$EXECUTIONS" | bc -l

