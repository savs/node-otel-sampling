#!/bin/bash
# Bash script to repeatedly hit http://localhost:8080/rolldice with a random pause between 0 and 2 seconds

while true; do
  response=$(curl -s http://localhost:8080/rolldice)
  echo "Response: $response"
  # Sleep for a random duration between 0 and 2 seconds
  sleep_time=$(awk -v min=0 -v max=2 'BEGIN{srand(); print min+rand()*(max-min)}')
  sleep $sleep_time
done
