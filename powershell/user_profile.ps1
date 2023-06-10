[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
Import-Module -Name Terminal-Icons

# PSReadLines
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'ctrl+d' -Function DeleteWord
Set-PSReadLineOption -PredictionSource History

#  Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'ctrl+f' -PSReadlineChordReverseHistory 'ctrl+r'

$env:GIT_SSH = "C:\Windows\System32\OpenSSH\ssh.exe"

# Aliases
Set-Alias -Name vim -Value nvim
Set-Alias -Name e -Value exit
Set-Alias -Name grep -Value findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function touch { Set-Content -Path ($args[0]) -Value ($null) }

function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# oh-my-posh init pwsh --config 'C:\Program Files (x86)\oh-my-posh\themes\night-owl.omp.json' | Invoke-Expression
Invoke-Expression (&starship init powershell)