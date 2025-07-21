#!/bin/sh

# Install Python 3.12 (on Amazon Linux 2023 or with correct repo for your distro)
yum install -y python3.12

# Create a virtual environment with Python 3.12
python3.12 -m venv /tmp/venv

# Upgrade pip and setuptools in the venv
/tmp/venv/bin/pip install --upgrade pip setuptools

# Install your package (editable mode)
/tmp/venv/bin/pip install -e .

# Copy all dependencies to ./aws_lambda_libs
cp -r /tmp/venv/lib/python3.12/site-packages/. ./aws_lambda_libs
cp -r /tmp/venv/lib64/python3.12/site-packages/. ./aws_lambda_libs
