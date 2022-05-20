FROM chef/chefdk:3.10

# required to use knife
RUN gem install bundler:2.1.4

# update and install basic tools
RUN apt update && apt upgrade -y && apt install nano inetutils-ping curl dnsutils -y
