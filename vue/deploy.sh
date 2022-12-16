#!/usr/bin/env sh

# сборка приложения
npm run build

# переход в каталог сборки
cd dist

# создание README.md
echo "###Для просмотра проекта перейдите по ссылке https://vladislav-chistyakov.github.io/vue-app-tehnozavr" > README.md

# инициализация репозиторий и загрузка кода на GitHub
git init
git add .
git commit -m "deploy"

git push -f https://github.com/Vladislav-Chistyakov/vue-app-tehnozavr.git master:gh-pages

#cd -
