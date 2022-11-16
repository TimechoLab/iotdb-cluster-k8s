#!/bin/bash

CONF_TMP_DIR=/iotdb/conf_tmp
CONF_DIR=/iotdb/conf

hostname=$(hostname)

cp ${CONF_TMP_DIR}/iotdb-datanode.properties ${CONF_DIR}/iotdb-datanode.properties.tmp
cp ${CONF_TMP_DIR}/iotdb-common.properties ${CONF_DIR}/iotdb-common.properties.tmp

sed -i "s/<HOSTNAME>/${hostname}/g" ${CONF_DIR}/iotdb-datanode.properties.tmp
sed -i "s/<HOSTNAME>/${hostname}/g" ${CONF_DIR}/iotdb-common.properties.tmp

echo "" >> ${CONF_DIR}/iotdb-datanode.properties
cat ${CONF_DIR}/iotdb-datanode.properties.tmp >> ${CONF_DIR}/iotdb-datanode.properties
echo "" >> ${CONF_DIR}/iotdb-common.properties
cat ${CONF_DIR}/iotdb-common.properties.tmp >> ${CONF_DIR}/iotdb-common.properties

bash /iotdb/sbin/start-datanode.sh