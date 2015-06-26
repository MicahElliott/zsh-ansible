# Ansible add-ons for Zsh

The `ans` command is a simple wrapper around `ansible` to accomplish two
things:

1. Make it simpler to copy/paste between the YAML in playbooks and CLI

2. Enable Zsh completion through simpler syntax
   (`-m module -a 'arg1=val1 arg2=val2'` is not very amenable to CLI completion)

## Contains
* `ans` -- simplified `ansible` command that's friendly for Zsh completion
* `_ans` -- completion for the `ansible` command
* `ansible-skeleton` -- for role creation (simpler than `ansible-galaxy` but
  not yet robust)

## Installation
Set `fpath` in `~/.zshrc`:

    fpath+=/path/to/zsh-ansible

## Usage
Lots of completions:

    % ans «tab»
    --- hosts group
    appsvrs    dbsvrs     failovers

    % ans appsvrs g«tab»
    --- ansible module
    gem:      -- Manage Ruby gems
    get_url:  -- Downloads files from HTTP, HTTPS, or FTP to node
    getent:   -- a wrapper to the unix getent utility
    git:      -- Deploy software (or files) from git checkouts
    group:    -- Add or remove groups

    % ans appsvrs gem: «tab»
    --- module arguments
    executable=            -- Override the path to the gem executable
    gem_source=            -- The path to a local gem used as installation ...
    include_dependencies=  -- Whether to include dependencies or not.
    name=                  -- [#REQUIRED#] The name of the gem to be managed.
    pre_release=           -- Allow installation of pre-release versions ...
    repository=            -- The repository from which the gem will be installed
    state=                 -- The desired state of the gem. latest ensures ...
    user_install=          -- Install gem in users local gems cache or for ...
    version=               -- Version of the gem to be installed/removed.

    % ans appsvrs gem: name=nokogiri state=installed -«tab»
    --- option
    -B  -- run asynchronously, failing after X seconds
    -C  -- dont make any changes
    -K  -- ask for sudo password
    -M  -- specify path(s) to module library (default=None)
    -P  -- set the poll interval if using -B (default=15)
    -R  -- run operations with su as this user (default=root)
    -S  -- run operations with su
    -T  -- override the SSH timeout in seconds (default=10)
    -U  -- desired sudo user (default=root)
    -c  -- connection type to use (default=smart)
    -f  -- specify number of parallel processes to use (default=5)
    -h  -- show this help message and exit
    -i  -- specify inventory host file (default=hosts)
    -k  -- ask for SSH password
    -l  -- further limit selected hosts to an additional pattern
    -o  -- condense output
    -s  -- run operations with sudo (nopasswd)
    -t  -- log output to this directory
    -u  -- connect as this user
    -v  -- verbose mode (-vvv for more, -vvvv to enable connection debugging)

Example of updating all _bases_:

    % ans failovers yum: 'name=*' state=latest -b -vv
