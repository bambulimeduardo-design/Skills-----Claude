#!/usr/bin/env bash
# Instala as skills de mattpocock/skills, fixadas em um commit revisado,
# para todos os agentes de IA da máquina (Claude Code, Codex, Cursor etc.).
#
# Uso:
#   bash install.sh                 instala todas as skills
#   bash install.sh tdd research    instala apenas as skills informadas
set -euo pipefail

# Commit revisado do repositório de origem. Para atualizar, troque o hash.
SOURCE="https://github.com/mattpocock/skills/tree/5863806dd4e15c63174bee4e7515a4256792ecfa"

if ! command -v npx >/dev/null 2>&1; then
  echo "Erro: npx não encontrado. Instale o Node.js (https://nodejs.org) e rode novamente." >&2
  exit 1
fi

if [ "$#" -gt 0 ]; then
  SELECTION=("$@")
else
  SELECTION=("*")
fi

echo "Instalando skills (${SELECTION[*]}) para todos os agentes..."
npx -y skills add "$SOURCE" -g -a '*' -s "${SELECTION[@]}" -y
echo "Concluído. Abra uma nova sessão do agente para carregar as skills."
