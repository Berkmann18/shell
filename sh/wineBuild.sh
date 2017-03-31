./configure prefix=$1 && make #$1=path to install directory
sudo make install
export WINEVERPATH=$W
export PATH=$W/bin:$PATH 
export WINESERVER=$W/bin/wineserver
export WINELOADER=$W/bin/wine
export WINEDLLPATH=$W/lib/wine/fakedlls
export LD_LIBRARY_PATH="$W/lib:$LD_LIBRARY_PATH" ec
#to change wineprefix:
#export WINEPREFIX=~/.wine-new
#wine winecfg 
#or WINEPREFIX=path_to_wineprefix wine winecfg