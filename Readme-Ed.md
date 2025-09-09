# Configure External Tools

Create or edit your MCP configuration file:

```bash
cat > ~/.config/kubectl-ai/mcp.yaml
```

Example `mcp.yaml`:
```yaml
servers:
  brave-search:
    command: "npx"
    args: ["-y", "@modelcontextprotocol/server-brave-search"]
    env:
      BRAVE_API_KEY: "${BRAVE_SEARCH_API_KEY}"
```

# Custom tools configuration

```bash
cat <<EOF > ~/.config/kubectl-ai/config.yaml
toolConfigPaths: ["~/.config/kubectl-ai/tools.yaml"]
EOF
```

```bash
cp contrib/openshift/tools.yaml ~/.config/kubectl-ai/tools.yaml
```

# Start kubectl-ai with Web UI

Set your OpenAI API key and launch the web UI:

```bash
export OPENAI_API_KEY=your_openai_api_key_here
kubectl-ai --llm-provider=openai --model=gpt-4.1 --ui-type web
```

# Start MCP Server

```bash
kubectl-ai --mcp-server --mcp-server-mode=sse --sse-endpoint-port=9080
```

# Start MCP Server with External Tools

```bash
kubectl-ai --mcp-server --external-tools --mcp-server-mode=sse --sse-endpoint-port=9080 -v=2
```

# Start MCP Server with External Tools and Customized tools

```bash
kubectl-ai --mcp-server --custom-tools-config=~/.config/kubectl-ai/tools.yaml --external-tools --mcp-server-mode=sse --sse-endpoint-port=9080 -v=2
```

# Start Llama Stack MCP Client

```bash
llama stack run llama-stack/mcp.yml
```

# Chat with the Server

Run the chat client:

```bash
python llama-stack/chat.py localhost 8321
```


## Alternative approach

# Integrate with Vscode

``
{
  "servers": {
    "kubectl-ai": {
      "type": "stdio",
      "command": "kubectl-ai",
      "args": [
        "--mcp-server",
        "--external-tools",
        "--custom-tools-config", "/Users/<edwardquarm>/.config/kubectl-ai/tools.yaml"
      ],
      "env": {
        "PATH": "/usr/local/bin:/usr/bin:/bin:/opt/homebrew/bin"
      }
    }
  }
}
``
# Build the depoloyment assistant image

``podman build -t quay.io/rh-ee-equarmjn/kubectl-ai:latest -f images/kubectl-ai/Dockerfile-oc .``

``podman push quay.io/rh-ee-equarmjn/kubectl-ai:latest``

# Run the deployment assistant

``podman run --rm -p 9080:9080 \
  -v "$HOME/.kube/config:/kube/config:ro,Z" \
  -e KUBECONFIG=/kube/config \
  quay.io/your-org/kubectl-ai:latest``

