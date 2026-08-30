# UNIX/Linux Shell Resource Configuration

### Configuration settings for the Bash Shell
Useful Bash profile and config settings for the Bourne Again Shell

## Usage
Use this repository as a Bash startup profile for your home account. Copy the standard Bash entrypoint files into your home directory, or merge the contents of this repo into your existing shell setup so that `.bashrc` remains the main interactive startup file and `.bash_profile` / `.profile` continue to delegate into it.

The modular settings are stored under `.bashrc.config`, so you can enable or disable optional tool-specific behavior by uncommenting the corresponding source block in `.bashrc` and starting a new shell session to reload the configuration.

This repository is released under the MIT license. The full text is included in the root `LICENSE` file.

## Table of Contents

- [How It Works](#how-it-works)
- [Recommended Configuration](#recommended-configuration)
- [Benefits](#benefits)
- [Standard Account Shell Configuration Files](#standard-account-shell-configuration-files)
- [Optional Configuration Settings](#optional-configuration-settings)
- [Platform Support](#platform-support)
- [Customization](#customization)
- [Notes](#notes)

## How It Works

This repo is designed to be integrated into an existing Bash profile rather than replacing it wholesale.

If you already have a mature `.bashrc` (or existing shell startup file), keep that file as the primary entrypoint and add a small source block to pull in the repo's modular settings. The files under `.bashrc.config` use absolute paths such as `~/.bashrc.config/core.bashrc`, so the directory must live in your home account.

A typical integration pattern looks like this:

```bash
# Keep your existing ~/.bashrc as the main startup file.
# Then source the repo's modular settings from ~/.bashrc.config.

if test -f ~/.bashrc.config/core.bashrc
then
	. ~/.bashrc.config/core.bashrc
fi

# Optional - uncomment only when you want to override the default prompt.
#if test -f ~/.bashrc.config/prompt.bashrc
#then
#	. ~/.bashrc.config/prompt.bashrc
#fi
```

This lets you preserve the default startup behavior while layering in the repo's reusable core settings, aliases, and optional tool-specific modules.

## Recommended Configuration

For most developers, enable these by default:
- `core.bashrc` - Always needed
- `aliases.bashrc` - General productivity aliases
- `git.bashrc` - Git integration and aliases

Then enable technology-specific configs as needed for your current project.

```bash
source ~/.bashrc
```

### Disable a Configuration

Simply comment out the relevant lines in `~/.bashrc`.

## Benefits

- **Cleaner main `.bashrc`**: Keep the main configuration file lightweight and manageable
- **Selective loading**: Only load what you need for your current project/task
- **Easier maintenance**: Update individual tool configurations without affecting others
- **Version control**: Track changes to specific tools independently
- **Portability**: Share specific configs across machines or projects

## Contents
The contents of the repo are divided into two groupings, as follows:

### Standard Account Shell Configuration Files

File|Description|Comment|
|---|---|---|
|.bashrc| Main Bash resource file. | Automatically loaded by Bash every time a new interactive shell is created. |
|.bash_profile| Login shell entry point. | Sources `.bashrc` to maintain a consistent Bash startup path. |
|.profile| Login-time compatibility file. | Also defers to `.bashrc` for a consistent Bash environment. |

> [!TIP]
> `.bashrc` is loaded each time a new terminal starts whereas `.bash_profile` is loaded only when you log in.


### Optional Configuration Settings
The `bashrc` file can pull in the following optional configurations, which are all located under the `.bashrc.config` directory. These are the partitioned settings that extend the standard Bash startup files with additional environment support for specific tools and workflows.

File|Description|Comment|
|---|---|---|
|core.bashrc| Core shell settings. | Handles OS detection, history, paths, and general shell defaults. |
|prompt.bashrc| Prompt and window title settings. | Handles platform-specific prompt styling and shell title behavior. |
|aliases.bashrc| General aliases. | Provides common alias definitions for everyday shell use. |
|git.bashrc| Git configuration and aliases. | Adds Git-related aliases and prompt integration. |
|x-display.bashrc| Optional X11 display configuration. | Used for X forwarding and display-related shell setup. (Note: This setting is necessary when accessing a UNIX host via an emulator.)|
|java.bashrc| Java configuration. | Adds Java environment settings and tooling paths. |
|maven.bashrc| Maven configuration. | Adds Maven environment settings and command aliases. |
|cmake.bashrc| CMake/C/C++ configuration. | Adds CMake and C/C++ development tooling support. |
|grpc.bashrc| gRPC configuration. | Provides environment paths and settings for gRPC work. |
|golang.bashrc| Go configuration. | Adds Go toolchain path support. |
|rust.bashrc| Rust configuration. | Sources the Cargo environment (`~/.cargo/env`) and sets `CARGO_HOME`. |
|gpg.bashrc| GPG configuration. | Provides GPG-related shell settings. |
|postgres.bashrc| PostgreSQL configuration. | Adds PostgreSQL tooling path configuration. |
|python.bashrc| Python configuration. | Adds Python environment path configuration. |

## Platform Support

All configurations support multiple platforms:
- Linux
- macOS
- Windows (Git Bash, Cygwin, MinGw)
- Unix variants (Solaris, HP-UX, AIX)

Platform-specific paths and settings are automatically detected and applied.

## Customization

You can:
- Create new config files for additional tools
- Source them conditionally in `~/.bashrc`
- Combine multiple configs by sourcing them together
- Override settings by sourcing configs in a specific order

Example: Creating a new `.bashrc.config/nodejs.bashrc`:

```bash
# Add to ~/.bashrc:
if test -f ~/.bashrc.config/nodejs.bashrc
then
	. ~/.bashrc.config/nodejs.bashrc
fi
```

## Notes

* The design is intentionally extendable: new shell-specific modules can be added under the `.bashrc.config` directory and sourced from `.bashrc` as needed. 

* The repo is now Bash-only focused. Shell settings for older shells such as C Shell, TC Shell and Korn Shell have been archived and are still available in the `archive-alternative-shells` branch of the GitHub repository.

* The project uses SPDX-style file headers and a root-level `LICENSE` file for the repository-wide MIT licensing terms.


