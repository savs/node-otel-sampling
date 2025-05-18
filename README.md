# OpenTelemetry Express App with Grafana Cloud

This is a simple Node.js Express app instrumented with OpenTelemetry and configured to export traces to Grafana Cloud.

## Setup

1. **Install dependencies:**
   ```sh
   npm install
   ```

2. **Set Grafana Cloud environment variables:**
   - `OTEL_EXPORTER_OTLP_ENDPOINT`: Your Grafana Cloud OTLP endpoint (e.g., `"https://otlp-gateway-prod-us-central-0.grafana.net:4317"`)
   - `OTEL_EXPORTER_OTLP_HEADERS`: Headers for authentication, e.g., `"authorization=Basic <base64 instance_id:api_key>"`
     - To generate the header, base64-encode your Grafana Cloud instance ID and API key as `instance_id:api_key`.

3. **Run the app:**
   ```sh
   npm start
   ```

To run in Docker:
   ```sh
   ./run.sh
   ```

Visit http://localhost:8080/rolldice to test or run ./rolldice_hit.sh to generate load.

## Endpoints
- `/rolldice` – Roll a dice

## Notes
- Traces will be visible in your Grafana Cloud account under Tempo/Traces.
- See [Grafana Cloud docs](https://grafana.com/docs/grafana-cloud/tempo/send-data/otlp/node-js/) for more details.
