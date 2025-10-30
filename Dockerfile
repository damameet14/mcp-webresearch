FROM node:20-bookworm

# Install dependencies
RUN apt-get update && apt-get install -y \
    make git python3 python3-venv curl \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy MCP server files
COPY package*.json ./
RUN npm install
COPY . .

# Install Playwright browsers
RUN npx playwright install --with-deps chromium


# Clone & set up SearxNG
RUN git clone https://github.com/searxng/searxng.git /searxng \
 && cd /searxng && make install

# Enable JSON output in settings.yml
RUN sed -i '78i\    - json' /searxng/searx/settings.yml

# Expose the port SearxNG runs on
EXPOSE 8080

# Start script to launch both services safely
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
