FROM centos:7
# FROM ubuntu:18.04

# ↓ for CentOS
COPY nginx.repo /var/tmp

# http://nginx.org/en/linux_packages.html#RHEL-CentOS
RUN yum install -y yum-utils; \
    mv /var/tmp/nginx.repo /etc/yum.repos.d; \
    chmod +x /etc/yum.repos.d/nginx.repo; \
    yum-config-manager --enable nginx-mainline; \
    yum install -y nginx; \
    systemctl enable nginx;

# https://nginx.org/en/linux_packages.html#Debian
# RUN apt-get update; \
#     apt-get install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring; \
#     curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
#     | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null; \
#     echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
#     http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
#     | sudo tee /etc/apt/sources.list.d/nginx.list; \
#     echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
#     | sudo tee /etc/apt/preferences.d/99nginx; \
#     apt-get update; \
#     apt-get install -y nginx;

ADD nginx.conf /etc/nginx/

ENTRYPOINT nginx -g 'daemon off;'
# ENTRYPOINT ["nginx", "-g", "daemon off;"]