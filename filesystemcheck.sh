#!/bin/bash
 
# Function to check disk space usage
check_disk_space() {
    echo "Checking disk space usage..."
    df -h | awk 'NR==1 || /\/$/'
    echo ""
}
 
# Function to check inode usage
check_inode_usage() {
    echo "Checking inode usage..."
    df -i | awk 'NR==1 || /\/$/'
    echo ""
}
 
# Function to check filesystem errors (only for ext filesystems)
check_filesystem_errors() {
    echo "Checking filesystem for errors..."
    filesystems=$(df -T | awk '$2 ~ /^ext/ {print $1}')
    for fs in $filesystems; do
        echo "Checking $fs..."
        sudo fsck -n $fs
        echo ""
    done
}
 
# Main function
main() {
    echo "Starting filesystem check..."
 
    check_disk_space
    check_inode_usage
    check_filesystem_errors
 
    echo "Filesystem check completed."
}
 
# Run the main function
main
