# Perfil de PowerShell (compartido entre PowerShell 7 y Windows PowerShell 5)

# fnm: cambia la versión de Node automáticamente al entrar a una carpeta
fnm env --use-on-cd | Out-String | Invoke-Expression

# ============================================================
# Alias
# ============================================================
Set-Alias -Name v -Value nvim

# ============================================================
# Git
# ============================================================
# $args pasa todo lo que escribas después, ej: gp origin main -> git push origin main

# gp es un alias propio de PowerShell (Get-ItemProperty), hay que quitarlo antes.
# Se usa Remove-Item porque Remove-Alias no existe en Windows PowerShell 5.
Remove-Item Alias:gp -Force -ErrorAction SilentlyContinue

function gcl { git clone $args }
function gpl { git pull $args }
function gp  { git push $args }
function ga  { git add $args }
function gf  { git fetch $args }
