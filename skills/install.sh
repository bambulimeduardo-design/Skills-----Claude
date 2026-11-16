#!/usr/bin/env bash
# Instala as skills deste repositório para todos os agentes de IA da máquina
# (Claude Code, Codex, Cursor, Cline etc.), no nível do usuário.
#
# Uso:
#   bash install.sh                 instala todas as skills
#   bash install.sh tdd research    instala apenas as skills informadas
set -euo pipefail

if ! command -v npx >/dev/null 2>&1; then
  echo "Erro: npx não encontrado. Instale o Node.js (https://nodejs.org) e rode novamente." >&2
  exit 1
fi

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"

if [ "$#" -gt 0 ]; then
  for skill in "$@"; do
    if [ ! -f "$SKILLS_DIR/$skill/SKILL.md" ]; then
      echo "Erro: skill '$skill' não existe em $SKILLS_DIR" >&2
      exit 1
    fi
  done
  SELECTION=("$@")
else
  SELECTION=("*")
fi

echo "Instalando skills (${SELECTION[*]}) para todos os agentes..."
npx -y skills add "$SKILLS_DIR" -g -a '*' -s "${SELECTION[@]}" -y
echo "Concluído. Abra uma nova sessão do agente para carregar as skills."
