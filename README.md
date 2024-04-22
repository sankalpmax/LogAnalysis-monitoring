<h1>Log Analysis and Monitoring Script<h1>

<h1>Overview/h1>

This project is aimed at automating the analysis and monitoring of log files using a Bash shell script. 
The script continuously monitors a specified log file for new entries, performs basic log analysis, and generates summary reports.

<h1>Features</h1>

Real-time Log Monitoring: The script uses tail command to track and display new log entries in real-time.
1. Log Analysis: Basic analysis of log entries including counting occurrences of specific keywords or patterns(e.g., error messages, warnings, info messages) and generating summary reports.
2. Error Handling: The script includes error handling to provide feedback on script execution and ensure graceful termination.
3. Logging: The script logs monitoring interruptions and other important events during execution.

<h1> Requirements </h1>
 Bash shell
 Unix-like operating system (Ubuntu 23.4)

 <h1> Usage </h1>

1.  Clone the repository:
    git clone https://github.com/sankalpmax/LogAnalysis-monitoring.git

3.  Navigate to the project directory:
    cd LogAnalysis-monitoring

5.  Run the script with the desired log file:
    ./log_monitor.sh myfile.log

    Note: The log file already in the project repo called myfile.log

6. Monitor the console output for log entries and analysis results.

7. Press Ctrl+C to stop monitoring and view the log analysis summary report.




 

