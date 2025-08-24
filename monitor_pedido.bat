@echo off
setlocal EnableDelayedExpansion

:: Lista de diretórios a monitorar
set dirs[0]=C:\Impressoes\Caixa
set dirs[1]=C:\Impressoes\Bar
set dirs[2]=C:\Impressoes\Cozinha

:: Nome do arquivo gerado pela impressão
set input=pedido.txt

:loop
for /l %%i in (0,1,2) do (
    set "dir=!dirs[%%i]!"
    if exist "!dir!\%input%" (
        call :processar "!dir!"
    )
)
timeout /t 1 >nul
goto loop

:processar
set "targetDir=%~1"

:: Gera timestamp via PowerShell (ex: 20250728_221451)
for /f %%t in ('powershell -command "Get-Date -Format yyyyMMdd_HHmmss"') do set "ts=%%t"

:: Define nome final
set "newFile=pedido_!ts!.txt"

:: Copia o conteúdo mantendo UTF-8
powershell -Command "Get-Content -Raw -Encoding UTF8 -Path '%targetDir%\%input%' | Out-File -Encoding UTF8 '%targetDir%\%newFile%'"

:: Apaga o original
del "%targetDir%\%input%"

echo [%time%] Gerado: %targetDir%\%newFile%
exit /b
