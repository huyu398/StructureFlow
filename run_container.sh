#!/bin/sh

FILE_DIR=$(cd $(dirname $0); pwd)
docker run \
  --gpus all \
  --mount type=bind,src=$FILE_DIR/example,dst=/root/StructureFlow/example \
  --mount type=bind,src=$FILE_DIR/results,dst=/root/StructureFlow/results \
  --mount type=bind,src=$FILE_DIR/result_images,dst=/root/StructureFlow/result_images \
  -w /root/StructureFlow \
  -it --rm structure_flow $@
  # --mount type=bind,src=$FILE_DIR,dst=/root/StructureFlow \
