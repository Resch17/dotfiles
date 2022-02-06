alias gs="git status"
alias gb="git branch"
alias gc="git checkout "
alias gcm="git commit -m "
alias gd="git branch -D "
alias gaa="git add --all"
alias nuke="rm -rf"
alias la="ls -la --color"
alias ls="ls --color --group-directories-first"
alias ..="cs .."
alias ...="cs ../.."
alias sbrc="source ~/.bashrc"
alias ebrc="vim ~/.bashrc"
alias glom="git pull origin main"

alias grep="grep --color=auto "

# starts json-server on port 8088, you fill in the filename
alias json="json-server -p 8088 "
alias dnr="dotnet run"

# location at terminal launch

help () {
  RED="\e[91m"
  ENDCOLOR="\e[0m"
  clear
  echo "╔═══════════════════════════════════════════════════════════════════════════════════════════╗"
  echo -e "║                                   ${RED}Aliases and Shortcuts${ENDCOLOR}                                   ║"
  echo "╠═════════════════════════════════════════════╤═════════════════════════════════════════════╣"
  echo "║  nuke [file or dir]                         │ Deletes a file or directory                 ║"              
  echo "║  mg [dirname]                               │ Creates and navigates into a new directory  ║"
  echo "║  ..                                         │ Alias for 'cd ..'                           ║"
  echo "║  ...                                        │ Alias for 'cd ../..                         ║"
  echo "║  gb                                         │ Displays all git branches                   ║"
  echo "║  gc [branch]                                │ Checks out branch with that name            ║"
  echo "║  gaa                                        │ Stages all modified files to be committed   ║"
  echo "║  gcm [message]                              │ Commits staged files with a message         ║"
  echo "║  glom                                       │ git pull origin main                        ║"
  echo "║  sbrc                                       │ Reloads ~/.bashrc file                      ║"
  echo "║  ebrc                                       │ Opens ~/.bashrc file in vim                 ║"
  echo "║  json                                       │ Starts json-server on port 8088             ║"
  echo "║  dnr                                        │ Builds & runs C# program in current dir     ║"
  echo "║  dnc [project name]                         │ Scaffolds a new C# program                  ║"
  echo "╚═════════════════════════════════════════════╧═════════════════════════════════════════════╝"
}

# creates a new directory and opens it
mg () {
  mkdir -p "$1" && cd $_
}

dnc () {
  dotnet new console -o "$1" && cd $_ && dnignore && code .
}

cls () {
  clear ; ls
}

cs () {
  cd "$1" ; ls
}

dnignore () {
    curl -L -s 'https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore' > .gitignore
}


# boilerplate html creation from NSS
simplehtml () {
    mkdir styles
    mkdir scripts
    echo '<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TITLE HERE</title>
    <link rel="stylesheet" href="./styles/main.css">
  </head>

  <body>
    <main id="container">

    </main>

    <script type="module" src="./scripts/main.js"></script>
  </body>
</html>' >> index.html

echo '@import url("https://fonts.googleapis.com/css?family=Roboto|Lora");

:root {
  --primary-color: #;
  --background-color: #;
  --link-color: #;
  --body-font: "Roboto", Arial, sans-serif;
  --heading-font: "Lora", serif;
}

/*Typography
--------------------------------------------------------------*/
body,
button,
input,
select,
textarea {
	color: #404040;
	font-family: var(--body-font);
	font-size: 14px;
	line-height: 1.5;
}

h1,h2,h3,h4,h5,h6 {
  font-family: var(--heading-font);
  letter-spacing: 2px;
}' >> styles/main.css

  echo 'console.log("Welcome to the main module")' >> scripts/main.js
  code .
}

