# resource "aws_launch_configuration" "launch_template" {
#   image_id        = "ami-007855ac798b5175e"
#   instance_type   = "t2.micro"
#   security_groups = ["${aws_security_group.docker_project_ec2.id}"]
#   user_data       = <<EOF
# #!/bin/bash
# export PATH=/usr/local/bin:$PATH

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# apt-get update

# # install docker community edition
# apt-cache policy docker-ce
# apt-get install -y docker-ce

# mkdir deployment_files

# cd deployment_files

# echo "blackbull8080" | docker login --username zubairsource --password-stdin

# echo '
# version: "3"
# services:
#   frontend:
#     image: zubairsource/devops-assignment-1.0.0
#     hostname: fe
#     networks:  
#       - appnet


#   nodebackend: 
#     image: zubairsource/mern_back
#     hostname: be
#     networks:  
#       - appnet

# networks:
#   appnet:
# ' >docker-compose.yml

# docker compose -p "devops_project" up -d

# EOF
#   lifecycle {
#     create_before_destroy = true
#   }
# }