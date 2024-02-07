# UNIX/Linux Shell Resource Configuration
### Configuration settings for various UNIX/Linux shells.


***
## Bash Shell
Useful Config/Profile for the Bourne Again Shell




File|Description|Comment|
|---|---|---|
|.bashrc| Default resource file. |Automatically loaded by Bash everytime a new shell is created.|
|.bashrc.alias| Dedicated placeholder for general alias definitions.|Automatically sourced by `.bashrc`.|
|.bashrc.display| Specific location for configuring DISPLAY setting. | Isolates `$DISPLAY` setting. Used by xterm and automatically referenced if X Windows installed. |
|.bashrc_profile| Default profile config when Bash launched.| Defers to `.bashrc`.|
|.profile| Example of .profile config, automatically sourced on login.| Defers to `.bashrc`.|



> [!TIP]
> `.bashrc` is loaded each time a new terminal starts whereas `.bash_profile` is loaded only when you log in. 

> [!IMPORTANT]  
> `.bashrc.alias` and `.bashrc.display` need to be located in the same (home) directory as `.bashrc`.

