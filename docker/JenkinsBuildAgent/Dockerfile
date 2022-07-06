FROM amazoncorretto

# Install Java 17
RUN  rpm --import https://yum.corretto.aws/corretto.key &&  curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo &&  yum install -y java-17-amazon-corretto-devel 
# Install Git
RUN yum install git -y
# Install Chrome
# RUN yum install wget -y 
# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
# RUN yum install ./google-chrome-stable_current_x86_64.rpm -y
# RUN ln -s /usr/bin/google-chrome-stable /usr/bin/chromium
# RUN rm -f google-chrome-stable_current_x86_64.rpm
# RUN yum install xorg-x11-server-Xvfb -y
# Install postgres 13
RUN amazon-linux-extras install postgresql13
RUN yum clean metadata

# Install php twig
RUN amazon-linux-extras enable php7.3
RUN yum clean metadata
RUN yum install php-cli php-pdo php-fpm php-json php-mysqlnd -y





RUN java -version

WORKDIR /home/nextw
COPY src/server-app-1.0 /home/nextw
RUN mkdir /home/nextw/log
VOLUME /tmp
ENV NW_CLOUD_SCHEMA=cloud20193
ENV NW_CLOUDAUTH_SCHEMA=cloud
ENV NW_SERVER_ID=master-api
ENV NW_AUTH_USER=nwadmin2017
ENV NW_AUTH_PWD=scuba2017FIFI0609
ENV NW_SYS_DB=jdbc:postgresql://nw2.cdfo1wce9k6c.us-west-1.rds.amazonaws.com:5432/nwdb1:nwpg2
ENTRYPOINT ["java","-cp","/home/nextw/lib/*","-XX:NewRatio=3","-XX:-OmitStackTraceInFastThrow","-Dnwlogdir=/home/nextw/log/","-server","net.nextworld.server.Startup","-wait","2000"]
