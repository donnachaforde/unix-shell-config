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

## How It Works

The main `~/.bashrc` file now sources config files selectively:

```bash
# Always sourced (core shell functionality)
source ~/.bashrc.config/core.bashrc
source ~/.bashrc.config/prompt.bashrc

# Optional - uncomment as needed
source ~/.bashrc.config/git.bashrc        # Recommended for developers
# source ~/.bashrc.config/java.bashrc      # For Java/Maven projects
# source ~/.bashrc.config/cmake.bashrc     # For CMake/C/C++ projects
# source ~/.bashrc.config/grpc.bashrc      # For gRPC development
# etc...
```

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

### x-display.bashrc
X11 display and terminal configuration:
- Xterm aliases: `xt`, `xtx`, `xwin`
- X11 paths and libraries
- Display settings sourcing
- **Note**: May be redundant on modern desktop environments with Wayland

### aliases.bashrc
General purpose aliases for everyday tasks:
- Directory navigation (`ls`, `ll`, `la`)
- Colored output for `grep`, `diff`, `df`, `du`
- DOS command emulation for Windows users
- Typo correction for `cd` command

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

## Platform Support

All configurations support multiple platforms:
- Linux
- macOS
- Windows (Git Bash, Cygwin, MinGw)
- Unix variants (Solaris, HP-UX, AIX)

Platform-specific paths and settings are automatically detected and applied.

## Migration from Previous Versions

If you're upgrading from earlier versions:

1. The new `.bashrc` maintains backward compatibility
2. Core settings are automatically loaded
3. General aliases and Git are now recommended to always enable
4. Technology-specific configs are individually selectable
5. The old `dev-tools.bashrc` has been split into individual files
6. X11 configuration is now optional (may be redundant on modern systems)

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

## Tips

- Use `alias` command to list all active aliases
- Use `echo $PATH` to verify paths are set correctly
- Use `type <command>` to see where a command comes from
- Uncomment only what you need to keep startup time minimal
- Git configuration is recommended for all developers
- X11 config is mainly useful for remote development or legacy systems
