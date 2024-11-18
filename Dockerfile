# Use the official OpenJDK image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the WAR or JAR file into the container
COPY target/your-application.war /app/your-application.war

# Install Tomcat (if using JSP with Tomcat)
RUN apt-get update && apt-get install -y wget && \
    wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.6/bin/apache-tomcat-10.1.6.tar.gz && \
    tar -xzvf apache-tomcat-10.1.6.tar.gz && mv apache-tomcat-10.1.6 /usr/local/tomcat

# Copy the WAR file to the Tomcat webapps directory
COPY target/your-application.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
