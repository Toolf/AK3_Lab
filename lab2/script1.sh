#!/bin/bash
find $1/ -type d -empty -delete
find $1/ -type f -empty -delete
