#!/bin/bash
if [ "$2" == "x64" -o "$2" == "64b" ]; then
	export WINEPREFIX="$HOME/.wine" WINEARCH=win64
else
	export WINEPREFIX="$HOME/.wine32-dotnet" WINEARCH=win32
fi
exec wine $1.exe
