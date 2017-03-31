#!/bin/bash

branch="master"

function st {
	if [ "$1" == "-b" -o "$1" == "--branch" ]; then
		branch="$2"
		shift 2
	elif [ "$2" == "-b" -o "$2" == "--branch" ]; then
		branch="$3"
		shift 2
	elif [ "$3" == "-b" -o "$3" == "--branch" ]; then
		branch="$4"
		shift 2
	elif [ "$4" == "-b" -o "$4" == "--branch" ]; then
		branch="$5"
		shift 2
	elif [ "$1" == "-h" -o "$1" == "--help" ]; then
		depHelp
	elif [ "$1" == "-i" -o "$1" == "--init" ]; then
		init $2
	elif [ "$1" == "-u" -o "$1" == "--update" ]; then
		update $2
	elif [ "$1" == "-d" -o "$1" == "--download" ]; then
		download $2
	elif [ "$1" == "-a" -o "$1" == "--add" ]; then
		add $2 $3
	elif [ "$1" == "-r" -o "$1" == "--restore" ]; then
		restore $2
	elif [ "$1" == "-l" -o "$1" == "--log" ]; then
		log $2
	elif [ "$1" == "-f" -o "$1" == "--feature" ]; then
		mkFeature $1
		feature $1 $2
	elif [ "$1" == "-R" -o "$1" == "--release" ]; then
		mkRelease $1
		release $1
	elif [ "$1" == "-H" -o "$1" == "--hotfix" ]; then
		mkHotfix $1
		hotfix $1
	elif [ "$1" == "-m" -o "$1" == "--maintain" ]; then
		maintain
	else
		commit $1 $2
	fi
	
}

function depHelp {
	echo Deploy a project to Github
	echo Usages: dep [-i] [project] [-b branch]
	echo -e "\tdep -d [username@host:/path/to/repo|http://host/username/path/to/repo]"
	echo -e "\tdep [-u|-a [file]] [comment] [-b branch]"
	echo -e "\tdep [comment] [-b branch]"
	echo -e "\tdep [-r file|-l [all|change]]"
	echo -e "\tdep -f [feature] [comment]"
	echo -e "\tdep [-R|-H] [version]\n"
	echo  "  -h, --help                  Display this help section."
	echo  "  -i, --init                  Initialise and deploy"
	echo  "  -u, --update                Update the Github repo"
	echo  "  project                     Name of the project"
	echo  "  -d, --download              Download the project from Github"
	echo  "  username@host:/path/to/repo Place to get it"
	echo  "  -a [file] [comment]         Add a file with the corresponding commit message"
	echo  "  --add ..."
	echo  "  -b branch, --branch branch  Branch to deploy at"
	echo  "  -r file, --restore file     File to restore from HEAD"
	echo  "  -l [|all|change]            Log, all logs or logs on the changes"
	echo  "  --list ..."
	echo  "  -f, --feature               Deploy a feature branch"
	echo  "  -R, --release               Deploy a release branch for a release candidate"
	echo  "  -H, --hotfix                Deploy a hotfix branch for a hotfix on the current master release"
	echo  "  -m, --maintain              Start a maintenance procedure"
	echo "If no parameters are specified, it will commit the changes (without pushing) while asking for commit details on the editor."
	echo  -e "\nIf you want to fill the body of the commit message, make sure that a markdown (.md) file (containing the body of the commit message) named either: update, updates, commit or message; is present on the current directory."
}

function init {
	git init
	git add .
	git commit -m "Initial commit"
	git remote add origin "https://github.com/Berkmann18/$1"
	git remote -v
	git push origin $branch
	git checkout -b develop master
}

function update {
	git add .
	if [ "$1" == "" -o -z "$1" ]; then
		if [ -e "update.md" ]; then
			git commit -F "update.md" -m "Update"
		elif [ -e "commit.md" ]; then
			git commit -F "commit.md" -m "Update"
		elif [ -e "message.md" ]; then
			git commit -F "message.md" -m "Update"
		elif [ -e "updates.md" ]; then
			git commit -F "updates.md" -m "Update"
		else
			git commit -m "Update"
		fi
	else
		if [ -e "update.md" ]; then
			git commit -F "update.md" -m "$1"
		elif [ -e "commit.md" ]; then
			git commit -F "commit.md" -m "$1"
		elif [ -e "message.md" ]; then
			git commit -F "message.md" -m "$1"
		elif [ -e "updates.md" ]; then
			git commit -F "updates.md" -m "$1"
		else
			git commit -m "$1"
		fi
	fi
	git push origin $branch
	echo -e "\n\t\tGit status\n"
	git status
}

function download {
	git init
	git pull origin $branch $1
}

function add {
	if [ "$1" == "" ]; then
		git add .
	else
		git add "$1"
	fi
	if [ "$2" == "" ]; then
		git commit -m "Add file via upload"	
	else
		git commit -m "$2"
	fi
	git push origin $branch
}

function restore {
	git restore -- $1
}

function log {
	git checkout $branch
	if ["$1" == ""]; then
		git log --graph --oneline --decorate & echo ""
	elif ["$1" == "all"]; then
		git log --graph --oneline --decorate --all & echo ""
	else
		git log --name-status & echo ""
	fi
}

function commit {
    git add .
	if [ "$1" == "" -o -z "$1" ]; then
		if [ -e "update.md" ]; then
			git commit -F "update.md" -e
		elif [ -e "commit.md" ]; then
			git commit -F "commit.md" -e
		elif [ -e "message.md" ]; then
			git commit -F "message.md" -e
		elif [ -e "updates.md" ]; then
			git commit -F "updates.md" -e
		else
			git commit -m "Update" -e
		fi
	else
		if [ -e "update.md" ]; then
			git commit -F "update.md" -e
		elif [ -e "commit.md" ]; then
			git commit -F "commit.md" -e
		elif [ -e "message.md" ]; then
			git commit -F "message.md" -e
		elif [ -e "updates.md" ]; then
			git commit -F "updates.md" -e
		else
			git commit -m "$1" -e
		fi
	fi
}

function mkFeature {
	git checkout -b $1 develop
	echo Feature branch added: $1
}

function feature {
	#assuming git checkout -b myfeature develop was already executed before working on that feature branch
	git commit -m $2
	git checkout develop
	git merge --no-ff $1 #no fast-forward from $1=myfeature to develop
	git branch -d $1
	git push origin develop
}

function mkRelease {
	git checkout -b release-$1 develop
	#changes/bumps happens here
	git commit -a -m "Bumped version to $1"
}

function release {
	git checkout master
	git merge --no-ff release-$1
	git tag -a $1
	git checkout develop
	git merge --no-ff release-$1
	git branch -d release-$1
}

function mkHotfix {
	git checkout -b hotfix-$1 master
	#changes/bumps happens here
	git commit -a -m "Bumped version to $1"
}

function hotfix {
	git commit -m "Hotfix: $2"
	git checkout master
	git merge --no-ff hotfix-$1
	git tag -a $1
	git checkout develop
	git merge --no-ff hotfix-$1
	git branch -d hotfix-$1
}

function updateBranch {
	git pull --rebase
}

function maintain {
	git fsck #validation
	git gc #compact the repo by removing outdated dangling objects
	git remote update --prune #prune remote tracking branches
	git stash list #stash check
}

st $1 $2 $3