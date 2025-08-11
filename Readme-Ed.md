Start kubectl-ai with web UI

``export OPENAI_API_KEY=your_openai_api_key_here``

``kubectl-ai --llm-provider=openai --model=gpt-4.1 --ui-type web``

Start mcp server

``kubectl-ai --mcp-server --mcp-server-mode=sse --sse-endpoint-port=9080``

Start kubectl mcp server with external tools

``kubectl-ai --mcp-server --external-tools --mcp-server-mode=sse --sse-endpoint-port=9080 -v=2``

Start llama stack mcp client

``llama stack run llama-stack/mcp.yml``


Chat with the server by running the ``chat.py`` with the following command:

``python chat.py localhost 8321``
