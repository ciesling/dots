#!/bin/bash

echo "Enter alias name:"
read alias_name

echo "Enter command:"
read alias_command

echo "alias $alias_name='$alias_command'" >> ~/.config/zsh/aliases

source ~/.config/zsh/aliases

echo "Alias $alias_name added successfully."
