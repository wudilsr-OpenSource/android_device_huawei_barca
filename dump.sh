#!/bin/bash
echo ""
echo "LineageOS 20.x dump blob for PRAGUE"
echo "please put *.img in raw format here before start"
echo "Executing in 5 seconds - CTRL-C to exit"
echo ""
sleep 5

mkdir dump
mkdir dump/system/
mkdir dump/vendor/
mkdir dump/product/
mkdir dump/odm/
mkdir dump/preavs/

sudo mount -o ro system.img dump/system/
sudo mount -o ro vendor.img dump/vendor/
sudo mount -o ro product.img dump/product/
sudo mount -o ro odm.img dump/odm/
sudo mount -o ro preavs.img dump/preavs/

echo "Start extraction"
sleep 5
sudo ./extract-files.sh prague ./dump/ > dump.log

echo "Reset owner"
sudo chown -R $(id -u):$(id -g) ./../../../vendor/huawei/hi6250-8-common/*
sudo chown -R $(id -u):$(id -g) ./../../../vendor/huawei/prague/*

echo "Umount all"
sleep 5
sudo umount dump/system/
sudo umount dump/vendor/
sudo umount dump/product/
sudo umount dump/odm/
sudo umount dump/preavs/

rm -rf dump/system/
rm -rf dump/vendor/
rm -rf dump/product/
rm -rf dump/odm/
rm -rf dump/preavs/
