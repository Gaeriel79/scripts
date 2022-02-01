dotadd.sh
cd ~
/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME commit -m "autoupdate"
/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME push http://github.com/Gaeriel79/dotfiles.git

cd scripts
git add -A
git commit -m "autoupdate"
git pull origin main
git push origin main
cd ~
