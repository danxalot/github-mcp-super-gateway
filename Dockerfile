FROM node:20-alpine

# Install MCP GitHub server and Supergateway
RUN npm install -g @modelcontextprotocol/server-github supergateway

# Expose port for SSE/HTTP
EXPOSE 8080

# Run Supergateway wrapping the GitHub MCP server
# This exposes stdio MCP over SSE/HTTP
CMD ["npx", "-y", "supergateway", \
     "--stdio", "npx -y @modelcontextprotocol/server-github", \
     "--port", "8080", \
     "--host", "0.0.0.0"]
