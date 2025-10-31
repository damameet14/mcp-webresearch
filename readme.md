# 🧠 MCP WebResearch

An **AI-ready MCP Server** that performs intelligent web searches using **SearxNG** and **Playwright** — all containerized for one-step setup.
This project provides both **manual** and **Docker** installation options for developers and Cline users.

---

## 🚀 Features

* 🔍 Integrated [SearxNG](https://github.com/searxng/searxng) meta search engine
* 🧭 Web automation via [Playwright](https://playwright.dev/)
* 🐳 One-command Docker setup (runs MCP + SearxNG together)
* 🧩 Supports JSON search results for easy AI processing

## Newly added features

* Now you can save the screenshots in your permanent memory. Just tell your AI to save the screen shot permanently.
* You can ask the AI to list the screenshots. This will give you the path at which the screenshots are saved. 
* More features are incoming...

---

## 🧰 Prerequisites

Before starting, ensure you have:

* [Docker](https://docs.docker.com/get-docker/) installed
* [Docker Compose](https://docs.docker.com/compose/install/) installed
* (Optional) [Node.js ≥ 18](https://nodejs.org/) if you want to run it manually

---

## ⚡ Quick Setup (Recommended via Docker)

This is the **easiest way** to get everything running.

1. **Clone this repository**

   ```bash
   git clone https://github.com/damameet14/mcp-webresearch.git
   cd mcp-webresearch
   ```

2. **Build and start the container**

   ```bash
   docker-compose up -d
   ```

   That’s it! 🎉

   * This automatically installs all dependencies.
   * Starts **SearxNG** on port **8080**.
   * Waits until it’s ready.
   * Then launches your **MCP server**.


---

## 🔧 Cline MCP Configuration

Once the container is running, edit your **`mcp_settings.json`**:

```json
"mcpServers": {
  "webresearch": {
    "command": "docker",
    "args": ["exec", "-i", "mcp-webresearch", "node", "/app/index.js"]
  }
}
```

This connects Cline directly to your running container.

---

## 🧱 Manual Setup (Without Docker)

If you don’t want to use Docker:

```bash
# Clone this repo
git clone https://github.com/damameet14/mcp-webresearch.git
cd mcp-webresearch

# Install MCP dependencies
npm install

# Clone and setup SearxNG
git clone https://github.com/searxng/searxng.git
cd searxng
make install

# Enable JSON output (important)
# Add "-json" to line 78 of searx/settings.yml manually

# Start SearxNG
make run # Note that you will have to start the searxng instance everytime you want to use the mcp server.

```

I am working on making "no docker" setup too a one command setup. But for now, I recommend going with Docker or go through this tiring process.

## 🔧 Cline MCP Configuration (for manual setup)

Once the container is running, edit your **`mcp_settings.json`**:

```json
"mcpServers": {
  "webresearch": {
    "command": "node",
    "args": ["<path_to>/mcp-webresearch/index.js"]
  }
}
```
---

## 🧠 How It Works

Inside the container:

1. SearxNG launches in the background.
2. A small startup script (`start.sh`) **waits until SearxNG is responsive**.
3. Then your MCP server (`index.js`) starts.

Both processes share the same network and communicate via `localhost:8080`.

---

## 🧩 Project Structure

```
mcp-webresearch/
├── index.js
├── package.json
├── Dockerfile
├── docker-compose.yml
├── start.sh
└── etc...
```

---


## ⚠️ Notes

* The default SearxNG config is patched automatically to support **JSON output** (`-json` format).
* The container is lightweight and will stay idle when unused.
* You can stop it anytime to free memory.

---

## 💡 Future Plans

* Add Windows-compatible setup
* Publish image to **Docker Hub** and **MCP Registry for AI code editors**
* Add more tools 

---

### Compatibility

* This is intended for Linux and MacOS.
* But if you want to use it on windows, you can do so with wsl (You can download it from Microsoft Store)

## 🧑‍💻 Author

**Meet Dama** ([@damameet14](https://github.com/damameet14))
Creator of the MCP WebResearch Server

---
