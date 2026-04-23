# Memory

## Me
Max (maxmeents@gmail.com). Windows user: `maxme`.

## Preferences
- **GitHub workflow:** use the `gh` CLI (GitHub CLI) for all GitHub actions — repo creation, pushes, PRs, Pages, releases. Max has gh installed on Windows. Prefer one-paste PowerShell blocks when handing commands back.
- **Parallel-agents pattern:** Cowork handles content/file work; Windsurf handles shell-y work (git, gh, local tooling, anything needing real network or terminal access). When a task in Cowork needs shell execution, hand Max a `windsurf://file/<path>` link (URL-encode spaces as `%20`) or drop an `open-in-windsurf.bat` in the folder so he can jump to Windsurf with one click while Cowork keeps running. Both agents can work on the same folder simultaneously.
- **Sandbox caveat:** Cowork's sandbox blocks `api.github.com` and `release-assets.githubusercontent.com`, so `gh` can't run from inside the sandbox. `github.com:443` itself is reachable, so `git push` with a PAT works for existing repos. Repo creation / Pages enablement must happen on Max's machine or in Windsurf.

## Environment
- **Windows workspace root for web projects:** `C:\wamp64\www\` (WAMP stack).
- **Windsurf install (likely):** `%LOCALAPPDATA%\Programs\Windsurf\Windsurf.exe` (per-user install on `maxme`).
- **Workspace-folder Windows paths are exposed to the sandbox via the `CLAUDE_CODE_WORKSPACE_HOST_PATHS` env var** — read this at the start of any session that needs the host path.

## Projects
| Name | What | Windows path | Windsurf link |
|------|------|--------------|---------------|
| **confirmation-bias** | Single-page explainer site (`index.html`, ~92KB). Goal: publish to GitHub Pages. | `C:\wamp64\www\confirmation bias` | `windsurf://file/C:/wamp64/www/confirmation%20bias` |

## Publishing to GitHub — standard flow
1. Cowork prepares content + commits conceptually, saves `CLAUDE.md` and launcher.
2. Hand Max a `windsurf://file/...` link (or tell him to double-click `open-in-windsurf.bat` in the folder).
3. In Windsurf's terminal, run the gh block: `git init -b main` → `git add .` → `git commit` → `gh repo create ... --public --source=. --push` → `gh api -X POST "repos/:owner/<repo>/pages" -f "source[branch]=main" -f "source[path]=/"`.
4. Cowork keeps iterating on content in parallel; pushes happen from Windsurf.
