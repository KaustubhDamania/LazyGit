# LazyGit

A Shell Script which adds, commits and pushes to the remote repository, all with one click!

To execute this script:

```
sudo chmod +x script.sh
./script.sh <directory-of-the-repository> <commit-message> <name-of-remote-branch>
```
The 3 arguments specified above are optional.

- If directory is not given, then current directory is assumed as directory where the repository exists

- If commit message is not given, then configured text editor is opened for writing commit message

- If name of remote branch is not given, then the current branch's name is considered.

For example,

```
    ./script.sh . "Random commit message" remote-branch
```
The above line creates a commit "Random commit message" in the current directory (because of the ".") and pushes it to a remote branch named "remote-branch".

# Note
- Before executing the script, make sure that remote URL is configured.
- Also, the commits will be made in current branch so switch to the desired branch before executing the script.
