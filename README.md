# UNIX/Linux Shell Resource Configuration

### Configuration settings for the Bash Shell
Useful Bash profile and config settings for the Bourne Again Shell

## Usage
Use this repository as a Bash startup profile for your home account. Copy the standard Bash entrypoint files into your home directory, or merge the contents of this repo into your existing shell setup so that `.bashrc` remains the main interactive startup file and `.bash_profile` / `.profile` continue to delegate into it.

The modular settings are stored under `.bashrc.config`, so you can enable or disable optional tool-specific behavior by uncommenting the corresponding source block in `.bashrc` and starting a new shell session to reload the configuration.

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
|core.bashrc| Core shell settings. | Handles OS detection, history, prompt, paths, and general shell defaults. |
|aliases.bashrc| General aliases. | Provides common alias definitions for everyday shell use. |
|git.bashrc| Git configuration and aliases. | Adds Git-related aliases and prompt integration. |
|x-display.bashrc| Optional X11 display configuration. | Used for X forwarding and display-related shell setup. (Note: This setting is necessary when accessing a UNIX host via an emulator.)|
|java.bashrc| Java/Maven configuration. | Adds Java and Maven-related environment settings. |
|cmake.bashrc| CMake/C/C++ configuration. | Adds CMake and C/C++ development tooling support. |
|grpc.bashrc| gRPC configuration. | Provides environment paths and settings for gRPC work. |
|golang.bashrc| Go configuration. | Adds Go toolchain path support. |
|gpg.bashrc| GPG configuration. | Provides GPG-related shell settings. |
|postgres.bashrc| PostgreSQL configuration. | Adds PostgreSQL tooling path configuration. |
|python.bashrc| Python configuration. | Adds Python environment path configuration. |

## Notes

* The design is intentionally extendable: new shell-specific modules can be added under the `.bashrc.config` directory and sourced from `.bashrc` as needed. 

* The repo is now Bash-only focused. Shell settings for older shells such as C Shell, TC Shell and Korn Shell have been archived and are still available in the `archive-alternative-shells` branch of the GitHub repository.


