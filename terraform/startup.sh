# #!bin/bash
# apt-get -y update

# #installing Docker
# apt-get -y install ca-certificates curl gnupg unzip
# mkdir -m 0755 -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg
# echo \
# "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt ]"
# "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable"
# sudo tee /etc/apt/source.list.d/docker.list > /dev/null

# apt-get -y update
# apt-get -y install docker-ce docker-ce-cli containerd.io

# systemctl enable docker
# systemctl start docker

# curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64
# unzip aws cliv2.zip
# sudo ./aes/install

# MONGO_URL=$(aws ssm get-parameter --name "/social-app/mongo)

# CURRENT_DIR=$(pwd)

# cat > "${CURRENT_DIR}/docker-compose.yml" <<EOL
# version: '3.8'

# services:
#   client:
#     image:
#     container_name:
#     networks:
#       - socialapp-network
#     restart:always

#   api:
#     image:
#     container_name:
#     environment:
#       - ports:5000
#       - MONGO_URL=${MONGO_URL}
#       - JWT_SECRET=secret
#     networks:
#       - socialapp-network
#     restart:always

#   nginx:
#     image:
#     container_name:
#     ports:
#       - "80:80"
#     networks:
#       - socialapp-network
#     restart:always
#     depends_on:
#       - client
#       - api

# networks:
#   socialapp-network:
# EOL


# cd "${CURRENT_DIR}"

# docker compose -p "social-app" pull
# docker compose -p "social-app" up -d
