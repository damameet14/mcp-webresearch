#!/bin/bash
set -e

echo "🚀 Starting SearxNG..."
cd /searxng
make run &

# Wait until SearxNG is responding on port 8080
echo "⏳ Waiting for SearxNG to start..."
until curl -s http://localhost:8080 > /dev/null; do
  sleep 2
done
echo "✅ SearxNG is up!"

# Start MCP Server
echo "🚀 Starting MCP Server..."
cd /app
exec node index.js
