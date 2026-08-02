# UNIX/Linux Shell Resource Configuration

### Configuration settings for the Bash Shell
Useful Bash profile and config settings for the Bourne Again Shell

## Usage
Copy or replace your `bashrc` with the version from this repo. 

## Contents


### Standard Account Shell Configuration Files

File|Description|Comment|
|---|---|---|
|.bashrc| Main Bash resource file. | Automatically loaded by Bash every time a new interactive shell is created. |
|.bash_profile| Login shell entry point. | Sources `.bashrc` to maintain a consistent Bash startup path. |
|.profile| Login-time compatibility file. | Also defers to `.bashrc` for a consistent Bash environment. |

> [!TIP]
> `.bashrc` is loaded each time a new terminal starts whereas `.bash_profile` is loaded only when you log in.


### Optional Configuration Settings
The `bashrc` file can pull in the following optional configurations, which are all located under the `.bashrc.config` directory. 

File|Description|Comment|
|---|---|---|
|core.bashrc| Core shell settings. | Handles OS detection, history, prompt, paths, and general shell defaults. |
|aliases.bashrc| General aliases. | Provides common alias definitions for everyday shell use. |
|git.bashrc| Git configuration and aliases. | Adds Git-related aliases and prompt integration. |
|x-display.bashrc| Optional X11 display configuration. | Used for X forwarding and display-related shell setup. |
|java.bashrc| Java/Maven configuration. | Adds Java and Maven-related environment settings. |
|cmake.bashrc| CMake/C/C++ configuration. | Adds CMake and C/C++ development tooling support. |
|grpc.bashrc| gRPC configuration. | Provides environment paths and settings for gRPC work. |
|golang.bashrc| Go configuration. | Adds Go toolchain path support. |
|gpg.bashrc| GPG configuration. | Provides GPG-related shell settings. |
|postgres.bashrc| PostgreSQL configuration. | Adds PostgreSQL tooling path configuration. |
|python.bashrc| Python configuration. | Adds Python environment path configuration. |


