#!/bin/bash

tgToken="7711609097:AAHZ8vnfajQi3psUuqrHhWSWraycn0u-DIE"
chatId="1230312571"
message="Test Text"
apiURL="https://api.telegram.org/bot$tgToken/sendMessage?"

create_user() {
    local user_type=$1
    local user_name=$2
    mkdir -p "$user_type/$user_name"
    message="Add new $user_type $user_name"
    curl -s -X POST $apiURL -d chat_id=$chatId -d "&" -d text="$message"
    echo "Пользователь $user_type $user_name создан."
}

edit_user() {
    local user_type=$1
    local old_name=$2
    local new_name=$3
    mv "$user_type/$old_name" "$user_type/$new_name"
    message="Edit $user_type $old_name for $new_name"
    curl -s -X POST $apiURL -d chat_id=$chatId -d "&" -d text="$message"
    echo "Пользователь $user_type $old_name переименован в $new_name."
}

delete_user() {
    local user_type=$1
    local user_name=$2
    rm -r "$user_type/$user_name"
    message="Delete $user_type $user_name"
    curl -s -X POST $apiURL -d chat_id=$chatId -d "&" -d text="$message"
    echo "Пользователь $user_type $user_name удалён."
}

if [[ $# -lt 2 ]]; then
    echo "Использование: $0 {create|edit|delete} user_name [new_name]"
    exit 1
fi

action=$1
user_type=$2
user_name=$3
new_name=$4

case $action in
    create)
        create_user $user_type $user_name
        ;;
    edit)
        if [ -z "$new_name" ]; then
            echo "Не указано новое имя для редактирования."
            exit 1
        fi
        edit_user $user_type $user_name $new_name
        ;;
    delete)
        delete_user $user_type $user_name
        ;;
    *)
        echo "Неверное действие. Используйте: create, edit или delete."
        exit 1
        ;;
esac