#!/bin/bash
# -------------------------------
# Git Commands Cheat Sheet
# -------------------------------

git init
# Initialize a new Git repository in the current folder

git clone <repo_url>
# Clone a remote repository to your local machine

git status
# Show the status of files (staged, unstaged, untracked)

git add <file> 
# Stage a file for commit

git add .
# Stage all changes in the current directory

git commit -m "message"
# Commit staged changes with a message

git log
# Show commit history

git diff
# Show changes in unstaged files

git diff --staged
# Show changes between staged files and last commit

git push
# Push committed changes to the remote repository

git pull
# Pull changes from remote repository and merge

git fetch
# Download remote changes without merging

git reset <file>
# Unstage a file (remove from staging area)

git reset --hard <commit>
# Reset repository to a specific commit (destructive)

git revert <commit>
# Create a new commit that undoes the changes of a previous commit

git branch
# List all local branches

git branch <branch_name>
# Create a new branch

git checkout <branch_name>
# Switch to an existing branch

git checkout -b <branch_name>
# Create a new branch and switch to it

git merge <branch>
# Merge another branch into the current branch

git rebase <branch>
# Reapply commits on top of another branch

git tag <tag_name>
# Add a tag to a commit

git stash
# Save current changes temporarily without committing

git stash pop
# Apply the stashed changes back and remove from stash

git show <commit>
# Show details of a specific commit

git config --global user.name "Your Name"
# Configure Git username globally

git config --global user.email "youremail@example.com"
# Configure Git email globally

git config --global credential.helper store
# Configire the credential to push to store so that no need to provide again and again

git config --list
# Show Git configuration

git blame <file>
# Show line-by-line commit info for a file

git grep "text"
# Search for a string in the repository

git rm <file>
# Remove a file from repository and stage the removal

git mv <old> <new>
# Rename or move a file and stage the change

git clean -f
# Remove untracked files from working directory

git remote -v
# Show configured remote repositories

git log --oneline --graph --all --decorate
# Visualize commit history in a compact graph
