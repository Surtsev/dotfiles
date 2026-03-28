#!/usr/bin/env bash

# activate-venv.sh - активирует .venv или venv в текущей директории
set -e

activate_venv() {
  local venv_path=""

  # Ищем .venv или venv
  if [ -f ".venv/bin/activate" ]; then
    venv_path=".venv"
  elif [ -f "venv/bin/activate" ]; then
    venv_path="venv"
  fi

  if [ -n "$venv_path" ]; then
    echo "direnv: activating $venv_path"
    source "$venv_path/bin/activate"
    return 0
  fi

  echo "direnv: no virtual environment found (.venv or venv)"
  return 1
}

# Вызываем основную функцию
activate_venv "$@"
