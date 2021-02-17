@echo off
@chcp 65001 >nul
title Копирование данных в картинку
echo Привет, я программа которая может взять твои данные и закинуть в картинку
echo Укажи место zip архив с данными (пример: C:\File\file.zip).
:comm
set /p comm= "> "
if ".%comm:~-3%" neq ".zip" (
  ECHO ERROR: Архив не в zip формате или это даже не архив, попробуйте ещё раз.
  goto comm
) else (
  ECHO Подождите...
  set name=%comm%
  echo Укажи место где картинкa
  echo Пример: C:\File\file.img (png, jpg)
  set /p img="> "
  set name2=%img%
  echo Пакование
  xcopy %img% C:\temp1.%img:~-3%
  xcopy %name% C:\temp2.%name:~-3%
  copy /b C:\temp1.%img:~-3% + C:\temp2.%name:~-3% C:\name.%img:~-3%
  echo Готово данные лежат на C:\name.%img:~-3%
pause
