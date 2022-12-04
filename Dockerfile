FROM maven
RUN sudo apt update
RUN git clone https://github.com/rajujaggu/spring-petclinic.git
RUN cd spring-petclinic
CMD ["echo" , "hello raj"]