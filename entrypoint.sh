#!/usr/bin/env bash
set -euo pipefail

: "${KUBECONFIG:?KUBECONFIG must be set to a readable kubeconfig path inside the container}"
if [[ ! -r "$KUBECONFIG" ]]; then
  echo "[entrypoint] ERROR: KUBECONFIG='$KUBECONFIG' is not readable." >&2
  ls -l "$(dirname "$KUBECONFIG")" || true
  exit 1
fi

echo "[entrypoint] Using KUBECONFIG=$KUBECONFIG"
exec /bin/kubectl-ai \
  --mcp-server \
  --mcp-server-mode=sse \
  --sse-endpoint-port="${SSE_PORT:-9080}" \
  --custom-tools-config="/etc/kubectl-ai/tools.yaml"