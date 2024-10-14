#!/bin/bash

read -p "Введите название проекта: " nameProject
read -p "Укажите директорию для создания: " dirProject

if [ ! -d "$dirProject"]; then
	echo "Директория не существует"
	exit 1
fi

cd "$dirProject"

mkdir -p "$nameProject/src/scripts"
mkdir -p "$nameProject/src/styles"
mkdir -p "$nameProject/src/images"

touch "$nameProject/README.md"
touch "$nameProject/.gitignore"

echo "Структура успешно создана!"
