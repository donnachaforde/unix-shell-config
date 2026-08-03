# Modular Bash Configuration

This directory contains modular bash configuration files that can be selectively sourced based on your current development needs.

## Structure

```
.bashrc.config/
├── core.bashrc           - Core shell settings (OS detection, history, paths)
├── prompt.bashrc         - Prompt and window title settings
├── aliases.bashrc        - General aliases (recommended)
├── git.bashrc            - Git configuration and aliases (recommended)
├── x-display.bashrc      - X11 display configuration (optional)
├── java.bashrc           - Java configuration
├── maven.bashrc          - Maven configuration and aliases
├── cmake.bashrc          - CMake and C/C++ development tools
├── grpc.bashrc           - gRPC configuration
├── golang.bashrc         - Golang configuration
├── gpg.bashrc            - GPG configuration
├── postgres.bashrc       - PostgreSQL configuration
├── python.bashrc         - Python configuration
└── README.md             - This documentation
```

## Module Reference

The files in this directory are meant to be sourced selectively from your main Bash startup entrypoint. For the integration workflow and the project-level overview, see the top-level [README.md](../README.md).

## Configuration Details

### core.bashrc
Contains essential shell functionality that's always active:
- OS and host detection (Linux, macOS, Windows, etc.)
- Terminal history settings
- System paths (for all platforms)
- Library and man page paths
- Console colors and dircolors setup

### prompt.bashrc
Contains prompt and window title behavior:
- Platform-specific prompt strings (Linux, macOS, Windows, Cygwin, AIX, HP-UX, SunOS)
- Window title handling via escape sequences
- Root versus normal-user prompt styling on Solaris variants

### git.bashrc
Git configuration and integration:
- Git aliases: `gs`, `gd`, `gl`, `gc`, `ga`, `gf`, `gsc`, `gsh`
- Git branch display in prompt (when in git repositories)
- Git bash completion (Linux, macOS, Windows)
- Platform-specific git paths

### aliases.bashrc
General purpose aliases for everyday tasks:
- Directory navigation (`ls`, `ll`, `la`)
- Colored output for `grep`, `diff`, `df`, `du`
- DOS command emulation for Windows users
- Typo correction for `cd` command

### x-display.bashrc
X11 display and terminal configuration:
- Xterm aliases: `xt`, `xtx`, `xwin`
- X11 paths and libraries
- Display settings sourcing
- **Note**: May be redundant on modern desktop environments with Wayland

### java.bashrc
Java and Maven development environment:
- Java home and classpath setup
- Maven aliases: `mci` (clean install), `mvd` (dependency tree), `mvp` (package), `mvr` (spring-boot run)

### cmake.bashrc
CMake and C/C++ development tools:
- CMake aliases: `cmk`, `cmkg`, `cmkb`, `cmkbv`, `cmkc`, `cmkt`, `cmktv`, `cmki`, `cmkir`, `cmku`

### Technology-Specific Files

#### grpc.bashrc
gRPC configuration:
- gRPC home, paths, libraries, and man pages

#### golang.bashrc
Golang configuration:
- Golang home and binary paths

#### gpg.bashrc
GPG configuration:
- GPG TTY setup (macOS)

#### postgres.bashrc
PostgreSQL configuration:
- psql binary paths (macOS via Homebrew)

#### python.bashrc
Python configuration:
- Python binary paths (macOS via Homebrew)

## Tips

- Use `alias` command to list all active aliases
- Use `echo $PATH` to verify paths are set correctly
- Use `type <command>` to see where a command comes from
- Uncomment only what you need to keep startup time minimal
- Git configuration is recommended for all developers
- X11 config is mainly useful for remote development or legacy systems
