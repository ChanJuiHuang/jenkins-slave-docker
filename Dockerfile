FROM jenkins
USER root
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y \
	yarn \
	net-tools \
	openssh-server \
	vim
RUN cat /usr/local/bin/jenkins.sh | sed "2a service ssh restart\n" > /tmp/jenkins.sh.tmp
RUN cat /tmp/jenkins.sh.tmp > /usr/local/bin/jenkins.sh && rm /tmp/jenkins.sh.tmp
WORkDIR /