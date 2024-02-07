# UNIX/Linux Shell Resource Configuration
### Configuration settings for various UNIX/Linux shells.


***
## Bash Shell
Useful Config/Profile for the Bourne Again Shell




File|Description|Comment|
|---|---|---|
|.bashrc| Default resource file |Automatically loaded by Bash on startup if located in home directory|
|.bashrc.alias| Dedicated placeholder for alias definitions.|Automatically sourced by .bashrc (if located in home dir).|
|.bashrc.display| Specific location for configuring DISPLAY setting. |Used by xterm. Automatically sourced by .bashrc (if located in home dir).|
|.bashrc_profile| Default profile config when Bash launched.| Sources our .bashrc profile.|


> [!TIP]
> `.bashrc` is loaded each time a new terminal starts whereas `.bash_profile` is loaded only when you log in. 



