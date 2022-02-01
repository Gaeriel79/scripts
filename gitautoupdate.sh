dotadd.sh
cd ~
dotconfig commit -m "autoupdate"
dotconfig push http://github.com/Gaeriel79/dotfiles.git

cd scripts
git add -A
git commit -m "autoupdate"
git pull origin main
git push origin main
cd ~
