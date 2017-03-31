git remote set-url --push origin https://github.com/$user/$1.git
git remote set-url --fetch origin https://github.com/$user/$1.git
git remote set-url origin https://github.com/$user/$1.git
#optional: allows to git push without specifying the remote (origin) and branch (master)
git push -u origin master
