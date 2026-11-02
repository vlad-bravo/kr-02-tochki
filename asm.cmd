@echo off

del tochki_rebuilt.gam 2>nul
del *.o 2>nul

C:\dev\wla_dx_v10.6_Win64\wla-8080.exe -i -o tochki.o tochki.asm

C:\dev\wla_dx_v10.6_Win64\wlalink.exe link.cfg tochki_rebuilt.gam

del *.o 2>nul

fc /b tochki_rebuilt.gam TOCHKI.GAM-memory-0000-FFFF.bin
