This is script is supposed to be a helper that aggregates commonly used commands.

You may run this script from the base directory of your current pigx-pipeline git/source directory, 
as it relies on the configure and make files beeing in the same directory.  

```
Usage: ./pigx-dev.sh [ subcommand [-c num] ] [-v]

Available subcommands are:
    b|build     Initialise pipeline from git folder, running bootstrap and configure
    c|clean     Remove test files
    t|test      Run tests

    -v|--version   Show toolkit version
    -h|--help      Show this help
```
