# Use Node.js LTS as the base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 8080

ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_INSECURE=true
ENV OTEL_RESOURCE_ATTRIBUTES="deployment.environment=development,service.name=node-sample-app,service.namespace=demo,service.instance.id=98606,demo=andrew"
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://alloy:4317
ENV OTEL_EXPORTER_OTLP_PROTOCOL=grpc
ENV NODE_OPTIONS="--require @opentelemetry/auto-instrumentations-node/register"
# Start the app
CMD ["npm", "start"]
