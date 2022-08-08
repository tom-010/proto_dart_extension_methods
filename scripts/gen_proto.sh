#!/bin/bash 

set -e 

SRC_DIR=./proto
DST_DIR=./lib/proto/
protoc -I=$SRC_DIR --dart_out=$DST_DIR $SRC_DIR/addressbook.proto

