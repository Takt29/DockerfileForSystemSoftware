SCRIPT_DIR=$(cd $(dirname $0); pwd)

mkdir -p ${SCRIPT_DIR}/workspace
docker run --name ssvm -it -v ${SCRIPT_DIR}/workspace:/root/workspace ss bash
