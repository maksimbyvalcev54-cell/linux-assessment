#!/bin/bash

set -e

DATE=$(date +%Y%m%d-%H%M%S)
ARCHIVE="linux-assessment-result-${DATE}.tar.gz"
TEMP_DIR="/tmp/linux-assessment-submit-$$"

echo "Подготовка результатов..."

mkdir -p "$TEMP_DIR"

rsync -a \
    --exclude='.git/' \
    --exclude='.devcontainer/' \
    --exclude='terminal-logs/' \
    --exclude='linux-assessment-result-*.tar.gz' \
    ./ "$TEMP_DIR/"

mkdir -p "$TEMP_DIR/terminal-logs"

if [ -d "terminal-logs" ]; then
    cp -a terminal-logs/. "$TEMP_DIR/terminal-logs/"
fi

cat > "$TEMP_DIR/ASSESSMENT_INFO.txt" <<INFO
Linux Assessment
Дата сдачи: $(date '+%Y-%m-%d %H:%M:%S')
Пользователь: $(whoami)
Рабочая директория: $(pwd)
INFO

echo "Создание архива..."

tar -czf "$ARCHIVE" -C "$TEMP_DIR" .

rm -rf "$TEMP_DIR"

echo ""
echo "========================================"
echo "Результаты подготовлены"
echo "========================================"
echo ""
echo "Файл:"
echo "$ARCHIVE"
echo ""
echo "Скачайте его через проводник VS Code"
echo "и передайте проверяющему."
echo ""
