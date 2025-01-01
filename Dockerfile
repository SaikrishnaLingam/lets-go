# Use the official Go image as the base image
FROM golang:alpine

# Install dependencies for Alpine
RUN apk add --no-cache git

# Set the working directory
WORKDIR /app

# Copy the Go module files
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the application source code
COPY . .

# Build the Go application
RUN go build -o main .

# Specify the command to run the application
CMD ["./main"]
