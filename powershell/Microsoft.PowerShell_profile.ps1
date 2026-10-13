# Perfil de PowerShell (compartido entre PowerShell 7 y Windows PowerShell 5)

# fnm: cambia la versión de Node automáticamente al entrar a una carpeta
fnm env --use-on-cd | Out-String | Invoke-Expression

# ============================================================
# Alias
# ============================================================
Set-Alias -Name v -Value nvim
