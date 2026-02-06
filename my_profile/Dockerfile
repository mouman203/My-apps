# Use official Flutter image
FROM ghcr.io/cirruslabs/flutter:stable

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Get dependencies
RUN flutter pub get

# Build APK
RUN flutter build apk

# Default command
CMD ["bash"]
