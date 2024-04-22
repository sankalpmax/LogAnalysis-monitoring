#!/bin/bash

LOG_FILE=$1                                                # Function to handle Ctrl+C
LOG_MONITOR_LOG="log_monitor.log"


cleanup() {
    echo "Monitoring stopped by user."
    exit 0
}


analyze_log() {                                             # Function to analyze log file
    echo "Performing log analysis..."
    
    error_count=$(grep -ic "error" "$LOG_FILE")              # Basic analysis - count occurrences of specific keywords
    warning_count=$(grep -ic "warning" "$LOG_FILE")
    http_count=$(grep -ic "HTTP" "$LOG_FILE")

                                                             # Generate summary report
    echo "Summary Report:"
    echo "Errors: $error_count occurrences"
    echo "Warnings: $warning_count occurrences"
    echo "HTTP: $http_count occurrences"
}


monitor_log() {                                              # Main function for monitoring log file
    echo "Monitoring log file: $LOG_FILE"
    tail -n +1 -f "$LOG_FILE" | while IFS= read -r line; do
        if [ -n "$line" ]; then
            echo "New log entry: $line"
        fi
    done
}

trap cleanup SIGINT                                          # Trap Ctrl+C


if [ -n "$line" ]; then                                      # Check if log file is provided as command line argument
    echo "Usage: $0 <log_file>"
    exit 1
fi

monitor_log &                                                 # Start monitoring the log file

wait                                                          # Wait for user to stop monitoring

analyze_log                                                   # Analyze the log file

