# In your Dockerfile.
FROM node:8.9.1

# The base node image sets a very verbose log level.
ENV NPM_CONFIG_LOGLEVEL warn

# Copy working directory into Docker workspace
COPY . .

# Build the app
RUN npm run build --production

# Setup a server
RUN npm install -g serve
# Run serve when the image is run.
CMD serve -s build
# Let Docker know about the port that serve runs on.
EXPOSE 5000
