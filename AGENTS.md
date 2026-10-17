# AGENTS.md

Repository guidelines and operational instructions for autonomous agents working in this codebase.

## Project Overview

- **Engine**: Hugo (Hugo Modules enabled, Go module `github.com/topgenorth/topgenorth.github.io`).
- **Theme**: [Mainroad](https://github.com/Vimux/Mainroad) imported via Hugo module `github.com/Vimux/Mainroad`.
- **Configuration**: `hugo.toml`.
- **Hosting & CI/CD**: GitHub Pages deployed via `.github/workflows/hugo-deploy.yml` on push to the `master` branch.

## Essential Commands

- **Local Preview Server**:
  ```bash
  hugo server -D
  ```
- **Build / Production Validation**:
  ```bash
  hugo build --gc --minify
  ```
- **Create New Content**:
  ```bash
  hugo new content posts/YYYY-MM-DD-post-title.md
  ```
- **Update / Manage Hugo Modules**:
  ```bash
  hugo mod get -u
  hugo mod tidy
  ```

## Content Architecture & Conventions

- **Content Root** (`content/`):
  - `posts/`: Active blog posts.
  - `archives/`: Historical/legacy blog posts.
  - `handloading/`: Handloading and ballistic notes/data (e.g., `6x45`, `8x57JS`).
  - Section index pages use `_index.md` or leaf bundles with `index.md`.
- **Front Matter**:
  - Standard YAML (`---`) or TOML (`+++`) front matter matching archetype conventions (`archetypes/default.md`).
  - Standard fields: `title`, `date`, `draft` (`true` while in progress), `categories`, `tags`, and optional `alias` for URL migrations/redirects.
- **Static Assets** (`static/`):
  - Static media (images, stylesheets, favicons) placed in `static/` or page bundles.
  - Referenced in markdown relative to the static root (e.g., `images/...` or `assets/...`).

## Agent Working Rules

- **Build Verification**: Ensure all changes pass `hugo build --gc --minify` without template errors, missing dependencies, or invalid front matter.
- **Preserve Configuration Integrity**: When editing `hugo.toml`, maintain existing menu structures, parameter hierarchies, and widget configurations.
- **Maintain Naming Conventions**: Use lowercase and kebab-case for file and directory names.
