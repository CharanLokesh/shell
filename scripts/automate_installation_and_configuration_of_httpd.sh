# !/bin/bash

# Install Apache HTTP Server
sudo yum install -y httpd

# Change port number (Assuming you want to change it to 8080)
sudo sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Update index page (Assuming you want to change it to a custom page)
echo "<html><body><h1>Hello, World!</h1></body></html>" | sudo tee /var/www/html/index.html > /dev/null

# Start the Apache service
sudo systemctl start httpd

# Enable Apache to start on boot
sudo systemctl enable httpd

# Display status
sudo systemctl status httpd

