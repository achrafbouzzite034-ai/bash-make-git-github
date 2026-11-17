#!/usr/bin/env bash

# Count regular files in the current directory (excluding hidden entries).
count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d ' '
}

# Ask the player to estimate the number of files.
ask_for_guess() {
    printf "How many files are in the current directory? "
    read -r guess
}

# Give a useful hint after each incorrect answer.
check_guess() {
    if (( guess < answer )); then
        echo "Too low. Try again."
    elif (( guess > answer )); then
        echo "Too high. Try again."
    else
        echo "Congratulations! You guessed correctly."
        return 0
    fi
    return 1
}

answer=$(count_files)

while true; do
    ask_for_guess
    if [[ "$guess" =~ ^[0-9]+$ ]]; then
        if check_guess; then
            break
        fi
    else
        echo "Please enter a whole number."
    fi
done
