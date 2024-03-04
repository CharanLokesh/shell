#!/bin/bash

# Check if running as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Install Apache HTTP Server
yum install -y httpd

# Check if installation was successful
if [ $? -ne 0 ]; then
    echo "Failed to install Apache HTTP Server"
    exit 1
fi

# Change port number (Assuming you want to change it to 8080)
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Update index page (Assuming you want to change it to a custom page)
echo "<html><body><h1>Hello, World!</h1></body></html>" | tee /var/www/html/index.html > /dev/null

# Start the Apache service
systemctl start httpd

# Check if Apache started successfully
if ! systemctl is-active --quiet httpd; then
    echo "Failed to start Apache HTTP Server"
    exit 1
fi

# Enable Apache to start on boot
systemctl enable httpd

# Display status
systemctl status httpd
