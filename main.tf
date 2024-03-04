resource "aws_lightsail_instance" "server1" {
  name = dev_server
  blueprint_id = "ubuntu_18_04"
  bundle_id = "medium1_0"
  availability_zone = "us_east_1a"
  user_data = <<-EOF
            #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo '<h1>This is deployed by Ange </h1>' | sudo tee /var/www/html/index.html
              sudo useradd Anged 
              EOF
}