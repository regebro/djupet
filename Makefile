.PHONY: all

all:
	wine ../ABCWin2/DosGen.exe ../ABCWin2/disks/djupet.dsk
	wine ../ABCWin2/DosCopy.exe ../ABCWin2/disks/djupet.dsk -t djupet.bas
	cd ../ABCWin2 && wine ABC80.exe
