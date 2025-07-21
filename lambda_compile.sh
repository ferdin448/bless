#!/bin/sh

# Install Python 3.12 if needed
yum install -y python312 python3.12-venv

# Use Python 3.12 for venv
python3.12 -m venv /tmp/venv
. /tmp/venv/bin/activate

# Upgrade pip and install dependencies
pip install --upgrade pip setuptools
pip install -e .

# Copy site-packages to lambda folder
mkdir -p ./aws_lambda_libs
cp -r /tmp/venv/lib/python3.12/site-packages/. ./aws_lambda_libs
cp -r /tmp/venv/lib64/python3.12/site-packages/. ./aws_lambda_libs || true