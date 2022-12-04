FROM ubuntu
RUN sudo apt update
RUN sudo apt install openjdk-11-jdk -y
RUN sudo apt install maven -y
RUN git clone https://github.com/rajujaggu/spring-petclinic.git
CMD ["echo" , "hello raj"]