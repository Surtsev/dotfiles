# ============================================
# ZSH Основные настройки
# ============================================

# Включаем расширенные возможности ZSH
setopt INTERACTIVECOMMENTS  # Комментарии в интерактивном режиме
setopt AUTO_CD              # cd в директорию без команды cd

# ============================================
# Oh My Zsh
# ============================================
export ZSH="$HOME/.oh-my-zsh"

# Тема оформления
ZSH_THEME="jispwoso"  # или "robbyrussell", "agnoster", "agnosterzak"

# Плагины Oh My Zsh
plugins=(
  git
  direnv
)

source $ZSH/oh-my-zsh.sh

# ============================================
# Дополнительные плагины (не входят в Oh My Zsh)
# ============================================

# Автодополнение (zsh-autosuggestions)
if [ -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Подсветка синтаксиса (zsh-syntax-highlighting)
if [ -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ============================================
# Environment Variables
# ============================================
export EDITOR=nvim
export PATH="$PATH:$HOME/.cargo/bin:$HOME/go/bin:$HOME/dotfiles/bin:$HOME/.local/bin"
export XCURSOR_THEME="MacOS-TahoeX-Cursor"
export XCURSOR_SIZE="24"

eval "$(zoxide init zsh)"

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval `dbus-launch --sh-syntax --exit-with-session`
fi

if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

# ============================================
# Алиасы (shellAliases из Nix)
# ============================================
alias l="eza --icons"
alias la="eza -a --icons"
alias lla="eza -lah --icons"
alias lt="eza --tree --icons"
alias llt="eza --tree -lah --icons"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"
alias gd="git diff"


# Дополнительные алиасы (из initContent)
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias cat="bat"
alias cd="z"
alias vim="nvim"

# ============================================
# fzf алиасы
# ============================================

# Быстрый поиск файлов
alias f='find . -type f | fzf --preview "bat --style=numbers --color=always {}"'
alias fd='find . -type d | fzf --preview "ls -la {}"'

# Поиск и открытие в nvim
alias v='nvim $(find . -type f | fzf)'

# Поиск в истории команд
alias h='history | fzf | sed "s/^[0-9 ]*//"'

# Поиск процессов
alias psf='ps aux | fzf --header-lines=1'

# Поиск и убийство процесса
alias killf='kill -9 $(ps aux | fzf | awk "{print \$2}")'

# Git: выбор ветки для переключения
alias gcof='git checkout $(git branch | fzf)'

# Git: выбор файла для добавления
alias gaf='git add $(git status --porcelain | fzf | cut -c 4-)'


alias vpn="QT_QPA_PLATFORM=xcb /usr/local/sbin/AmneziaVPN"

# --- Алиасы для управления SSH-туннелем (прокси) ---
# Функция для проверки, запущен ли туннель
proxy-status() {
    if pgrep -f "ssh.*-D 1080" > /dev/null; then
        echo "✅ SSH-туннель (прокси) ЗАПУЩЕН"
    else
        echo "❌ SSH-туннель (прокси) ОСТАНОВЛЕН"
    fi
}

# Включить прокси
alias proxyon='ssh -D 1080 -f -N root@5.178.109.136'

# Выключить прокси
alias proxyoff='sudo pkill -f "ssh.*-D 1080"'

# Показать статус прокси
alias proxystatus='proxy-status'
# --- Конец секции прокси ---


# ============================================
# Функции
# ============================================

# Приветствие (аналог fish_greeting)
function greet_fastfetch() {
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
  fi
}
greet_fastfetch

# mkcd - создать директорию и перейти в нее
function mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# extract - распаковать архив любого типа
function extract() {
  local filename
  filename="$(basename "$1")"
  
  case "$filename" in
    *.tar.gz)  tar xzf "$1" ;;
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.xz)  tar xJf "$1" ;;
    *.zip)     unzip "$1" ;;
    *.rar)     bsdtar xf "$1" ;;
    *) echo "Unknown file type for $filename" ;;
  esac
}

# ============================================
# Интеграция с fzf
# ============================================
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# ============================================
# Дополнительные настройки
# ============================================

# История команд
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Автодополнение
autoload -Uz compinit
compinit

# Обработка шаблонов (case-insensitive completion)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ============================================
# Установка плагинов (если их нет)
# ============================================

# Автоматическая установка Oh My Zsh если не установлен
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Установка zsh-autosuggestions если не установлен
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions"
fi

# Установка zsh-syntax-highlighting если не установлен
if [ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"
fi

# opencode
export PATH=/home/surtsev/.opencode/bin:$PATH
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/surtsev/.local/share/flatpak/exports/share"
