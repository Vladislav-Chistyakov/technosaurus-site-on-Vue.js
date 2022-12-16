#!/usr/bin/env sh

# Остановить публикацию при ошибках
set -env

# сборка приложения
npm run build

# переход в каталог сборки
cd dist

# инициализация репозиторий и загрузка кода на GitHub
git init
git add .
git commit -m "deploy"

git push -f https://github.com/Vladislav-Chistyakov/vue-tehnosaurus.github.io master:gh-pages

cd -

