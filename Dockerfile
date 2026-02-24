# Use a lightweight web server
FROM nginx:alpine

# Copy all files from repo into Nginx default directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
