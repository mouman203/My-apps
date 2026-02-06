#we start with bring in the base image
FROM ghcr.io/cirruslabs/flutter:stable
#then we have to name the work directory
WORKDIR /docker_test

# copy the app folder and put it in the work directory
COPY . .   
# now we have to install the dependencies
RUN flutter pub get

# finally we have to build the app for the other developer to be able to run it
RUN flutter build apk --release