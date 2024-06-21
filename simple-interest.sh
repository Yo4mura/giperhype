#!/bin/bash
# Скрипт для расчета простого процента
# Формула: P = (principal * rate * time) / 100

echo "Введите основную сумму:"
read principal
echo "Введите процентную ставку (в процентах):"
read rate
echo "Введите время (в годах):"
read time

interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
echo "Простой процент: $interest"
