#!/bin/bash

box="$1"
box_file_name="$2"

echo
echo "Box:          ${box}"
echo "Box File to create:     ${box_file_name}"

echo
read -p "Are these values correct? (y/N) " proceed
echo

if [[ "${proceed}" != "y" && "${proceed}" != "Y" ]]; then
    echo "Exiting, since you indicated the values are incorrect."
    exit 1
fi

echo "Proceeding..."
echo

cp Vagrantfile.template Vagrantfile
sed -i -e "s|{{ box }}|${box}|g;s|{{ vm_name }}|${box}|g" Vagrantfile

vagrant up

vagrant package --output "${box_file_name}"