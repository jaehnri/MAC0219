# Fetch only "real time" from time command
TIMEFORMAT=%R

# Compile both programs
go build montecarlo.go

kotlinc Montecarlo.kt -d

for i in `seq 1 10`
do
  time M
done

