
#!/bin/bash

# Update system packages
apt-get update -y

# Install Apache web server
apt-get install apache2 -y

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Create website page
cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Jenkins Terraform Project</title>
</head>
<body>
    <h1>Welcome to Mudassar Website</h1>
    <h2>Deployed using Jenkins and Terraform</h2>
</body>
</html>
EOF
