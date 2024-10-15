#!/bin/bash

read -p "Введите имя пользователя: " userName

mkdir -p users/
userDir="users/$userName"
mkdir "$userDir"
cd "$userDir" || exit

git init
git add ./
git commit -m "Crete folder"

createStructure()
{
	local baseDir="$1"
	local ext="$2"
	mkdir -p "$baseDir"

	for year in 2020 2021 2022 2023 2024; do
		mkdir -p "$baseDir/$year"
		touch "$baseDir/$year/default.$ext"
	done

	git add "$baseDir"
	git commit -m "Добавлены папки и файлы для $baseDir"
}

createStructure "photos" "png"
createStructure "videos" "mp4"
createStructure "documents" "mp4"
