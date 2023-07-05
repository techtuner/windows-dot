Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

function choco_packages() {
    $choco_apps = "sudo", "nvm", "python", "golang", "brave", "adobereader", "vlc", "winrar", "wget", "curl", "cmake", "lazygit", "oh-my-posh", "powertoys", "jq", "neovim", "gh", "rust", "starship", "git", "fzf", "notion"

    foreach ($app in $choco_apps) {
        choco install $app -y
    }
}

# Make Directories to store files
mkdir ~\Documents\Powershell
mkdir ~\.config\powershell
mkdir D:\Projects
mkdir D:\Notes

$user = $env:USERNAME

Copy-Item .\powershell\Microsoft.PowerShell_profile.ps1 ~\Documents\Powershell\
Copy-Item .\powershell\user_profile.ps1 C:\Users\$user\.config\powershell\
Copy-Item .\starship\starship.toml C:\Users\$user\.config\
Copy-Item .\wallpapers\ C:\Users\$user\Pictures\ -Recurse
Copy-Item .\nvim\ $env:LOCALAPPDATA -Recurse

Remove-Item $env:LOCALAPPDATA\nvim\Neovim.md
Remove-Item $env:LOCALAPPDATA\nvim\neovim_setup.png

Unblock-File -Path C:\Users\$user\.config\powershell\user_profile.ps1
Unblock-File -Path C:\Users\$user\Documents\Powershell\Microsoft.PowerShell_profile.ps1

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco_packages

$extension_list = "formulahendry.auto-complete-tag",
"formulahendry.auto-rename-tag",
"naumovs.color-highlight",
"miguelsolorio.fluent-icons",
"miguelsolorio.symbols",
"golang.go",
"visualstudioexptteam.vscodeintellicode",
"ritwickdey.liveserver",
"sumneko.lua",
"yzhang.markdown-all-in-one",
"christian-kohler.path-intellisense",
"esbenp.prettier-vscode",
"steoates.autoimport",
"dbaeumer.vscode-eslint",
"bradlc.vscode-tailwindcss",
"ms-python.python",
"ms-python.black-formatter",
"aaron-bond.better-comments",
"wix.vscode-import-cost",
"usernamehw.errorlens",
"wayou.vscode-todo-highlight",
"equinusocio.vsc-community-material-theme",
"kisstkondoros.vscode-gutter-preview", ,
"ms-vscode.powershell",
"yummygum.city-lights-theme",
"silofy.hackthebox",
"inci-august.august-themes",
"rust-lang.rust-analyzer",
"ms-python.vscode-pylance",
"vadimcn.vscode-lldb",
"bungcip.better-toml",
"serayuzgur.crates"

foreach ($extension in $extension_list) {
    code --install-extension $extension
}

Copy-Item .\vscode\settings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse
Copy-Item .\vscode\keybindings.json C:\Users\$user\AppData\Roaming\Code\User\ -Recurse

git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
