# dotfiles

Configurações pessoais para agentes de IA. Hoje o repositório guarda as **skills** que uso no Claude Code, Codex, Cursor e nos demais agentes compatíveis.

## Instalação em uma máquina nova

Requisito: Node.js (fornece o `npx`).

```bash
git clone https://github.com/bambulimeduardo-design/Skills-----Claude.git
bash Skills-----Claude/install.sh
```

Para instalar apenas algumas skills:

```bash
bash Skills-----Claude/install.sh research tdd diagnosing-bugs
```

O script instala no nível do usuário (`~/.agents/skills`), com links para cada agente (por exemplo `~/.claude/skills`). Abra uma nova sessão do agente depois de instalar.

## Claude (claude.ai e app desktop)

O Claude na web não lê skills do computador. Para usar uma skill lá, compacte a pasta dela e envie em **Configurações > Capacidades > Skills**:

```bash
cd skills && zip -r research.zip research
```

## Origem e atualização

As skills foram copiadas de [mattpocock/skills](https://github.com/mattpocock/skills), commit `5863806` (12/11/2026), sob licença MIT (ver `skills/LICENSE-mattpocock`).

Como as skills estão versionadas aqui, elas só mudam quando você decide. Para trazer a versão mais recente do autor:

```bash
npx -y skills add mattpocock/skills -g -a '*' -s '*' -y
rm -rf skills/*/ && cp -rL ~/.agents/skills/. skills/
git diff --stat
```

Revise o diff antes de commitar: skills rodam com as permissões completas do agente.

## Skills incluídas

| Skill | Descrição |
|---|---|
| `ask-matt` | Ask which skill or flow fits your situation. A router over the skills in this repo. |
| `chief-of-staff` | Pursue a long-running goal in a single session by co-ordinating subagents. |
| `claude-handoff` | Hand the current conversation off to a fresh background agent that picks up the work immediately. |
| `code-review` | Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes: Standards (does th |
| `codebase-design` | Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interfac |
| `diagnosing-bugs` | Diagnosis loop for hard bugs and performance regressions. Use when the user says diagnose/debug this, or repor |
| `domain-modeling` | Build and sharpen a project's domain model. Use when discussing codebase terminology, writing or editing a GLO |
| `git-guardrails-claude-code` | Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before t |
| `grill-me` | A relentless interview to sharpen a plan or design. |
| `grill-with-docs` | A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go. |
| `grilling` | Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thin |
| `handoff` | Compact the current conversation into a handoff document for another agent to pick up. |
| `implement` | Implement a piece of work based on a spec or set of tickets. |
| `implement-spec` | Implement the result of /to-spec and /to-tickets in code. |
| `improve-codebase-architecture` | Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whicheve |
| `loop-me` | Grill me about specs for the workflows I want to build, within this workspace. |
| `migrate-to-shoehorn` | Migrate test files from `as` type assertions to @total-typescript/shoehorn. Use when user mentions shoehorn, w |
| `pr` | Use when writing a PR body. |
| `prototype` | Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a sta |
| `research` | Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the r |
| `retro` | Conduct a retrospective on a coding session. |
| `scaffold-exercises` | Create exercise directory structures with sections, problems, solutions, and explainers that pass linting. Use |
| `setup-matt-pocock-skills` | Configure this repo for the engineering skills: set up its issue tracker, triage label vocabulary, and domain  |
| `setup-pre-commit` | Set up Husky pre-commit hooks with lint-staged (Prettier), type checking, and tests in the current repo. Use w |
| `setup-ts-deep-modules` | Wire dependency-cruiser into a TypeScript repo so each package is a deep module, with implementation hidden in |
| `tdd` | Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions red-green- |
| `teach` | Teach the user a new skill or concept, within this workspace. |
| `to-questionnaire` | Turn a decision you can't fully answer into a questionnaire for someone else to fill in. |
| `to-spec` | Turn the current conversation into a spec and publish it to the project issue tracker: no interview, just synt |
| `to-tickets` | Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocki |
| `triage` | Move issues and external PRs through a state machine of triage roles, categorise, verify, grill if needed, and |
| `wait-what` | Stop. That last message did not land: re-pitch it. |
| `wayfinder` | Plan a huge chunk of work (more than one agent session can hold) as a shared map of decision tickets on your i |
| `wizard` | Generate an interactive bash wizard that walks a human through steps only they can perform. Use when provision |
| `writing-beats` | Writing, exploit; assemble raw material into a journey of beats, grounding each term before a beat leans on it |
| `writing-for-agents` | Writing documents for agents. Use when creating or editing skills, or modifying AGENTS.md or CLAUDE.md. |
| `writing-fragments` | Writing, explore: mine raw fragments, no structure yet. |
| `writing-shape` | Writing, exploit: shape raw material into an article, paragraph by paragraph. |
