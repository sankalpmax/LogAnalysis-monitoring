#!/bin/bash

LOG_FILE=$1
LOG_MONITOR_LOG="log_monitor.log"


cleanup() {
    echo "Monitoring stopped by user."
    exit 0
}


analyze_log() {
    echo "Performing log analysis..."
    # Basic analysis - count occurrences of specific keywords
    error_count=$(grep -ic "error" "$LOG_FILE")
    warning_count=$(grep -ic "warning" "$LOG_FILE")
    http_count=$(grep -ic "HTTP" "$LOG_FILE")

    # Generate summary report
    echo "Summary Report:"
    echo "Errors: $error_count occurrences"
    echo "Warnings: $warning_count occurrences"
    echo "HTTP: $http_count occurrences"
}


monitor_log() {
    echo "Monitoring log file: $LOG_FILE"
    tail -n +1 -f "$LOG_FILE" | while IFS= read -r line; do
        if [ -n "$line" ]; then
            echo "New log entry: $line"
        fi
    done
}

trap cleanup SIGINT


if [ -n "$line" ]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

monitor_log &


wait


analyze_log

