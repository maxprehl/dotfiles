# dotfiles

Slowly but surely I will learn what all of these dots mean.

## Installation

The method for using these dotfiles is the [git "bare" repo](https://www.atlassian.com/git/tutorials/dotfiles).

This way the working tree for the git repo can be in the HOME directory, 
while the git directory can be stored somewhere else. (in our case $HOME/dotfiles.git)

The way to set up a new system follow these instructions:

1. Make sure git is installed.
2. Make sure you're working in your $HOME directory.
3. Add the `git df` alias to git: 
    * `git config --global alias df="!git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME"`
    * (or use my [.gitconfig](./.gitconfig) `wget https://raw.githubusercontent.com/maxprehl/dotfiles/master/.gitconfig`)
4. Clone the repo's git directory ONLY:
    * `git df clone git@github.com:maxprehl/dotfiles.git`
    * You should now have a new folder in your home directory called `dotfiles.git`
    * The only thing in there are some other directories that git will use to keep track of the repos.
5. Set the repo to NOT show untracked files
    * `git df config --local status.showUntrackedFiles no`
    * Since the working directory is $HOME, all subdirectories will show up as untracked, which we DON'T want.
    * Instead we'll just manually add/update the configs we want to track.
6. Back up offending files

    ```sh
    mkdir -p .dotfiles-backup && \
    git df checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .dotfiles-backup/{}
    ```

7. Pull down the relevant files. (you may get warnings about overwrites)
    * `git df checkout <branch>`
    * Look at the next section to figure out which branch you should be using.
8. You're literally good to go
    * `git df status` to see any updates
    * `git df add <file>` to add any new configs to the repo
    * `git df fetch` to see if there were any updates on the remote
    * `git df pull` to pull in updates
    * `git df commit` + `git df push` to add local updates to the remote

## THERE ARE MULTIPLE BRANCHES OF THIS REPO

The `master` branch is meant for use in it's own proper working repository to compare example files, handle merging from the other branches, etc.

Use the `wsl` branch for use in Windows Subsystem for Linux environments. This enables both Linux and Windows configuration from one place.

Use the `linux` branch for linux-only systems (bare metal installs, VM's, etc)

Use the `windows` branch for windows-only systems (although I don't know why you would lol) Also check out the [windows specific instructions](./WindowsConfigs/README.md)

## Todo
- [ ] Customize / Review important dotfiles
    - [x] .gitconfig
    - [x] .vimrc
    - [ ] .bashrc
    - [ ] .dircolors
    - [ ] .tmux.conf
    - [ ] .profile?
    - [ ] .profile (powershell)?

- [ ] Documentation
    - [x] Create Repo Readme
    - [x] Installation/Usage steps
    - [ ] Windows Documentation

- [ ] Create one-liner for the git bare repo setup and cloning

- [ ] Windows
    - [x] Script for setting Windows application configs
    - [ ] Bare repo option for Windows installs as well?
    - [ ] Curate a new software list for Windows installs
    - [ ] Software install script using Chocolatey (or winget)

- [ ] Linux
    - [x] Seperate linux-only branch
    - [ ] Curate software list for Linux installs
    - [ ] Software install script (diff package managers tho??)
