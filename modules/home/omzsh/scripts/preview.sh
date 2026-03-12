#!/usr/bin/env bash

file="$1"

if [[ -d "$file" ]]; then
  eza --tree --level=2 --color=always "$file"
elif [[ -f "$file" ]]; then
  case "$(file --mime-type -b "$file")" in
    text/*)
      bat --style=numbers --color=always "$file"
      ;;
    image/*)
      chafa "$file"
      ;;
    application/pdf)
      pdftotext "$file" - | head -200
      ;;
    *)
      file "$file"
      ;;
  esac
fi

