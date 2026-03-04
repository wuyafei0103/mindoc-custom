#!/bin/bash
set -eux

# 默认资源
if [ ! -d "/mindoc/conf" ]; then mkdir -p "/mindoc/conf"; fi
if [[ -z "$(ls -A -- "/mindoc/conf")" ]]; then cp -r "/mindoc/__default_assets__/conf" "/mindoc/"; fi

if [ ! -d "/mindoc/static" ]; then mkdir -p "/mindoc/static"; fi
if [[ -z "$(ls -A -- "/mindoc/static")" ]]; then cp -r "/mindoc/__default_assets__/static" "/mindoc/"; fi

if [ ! -d "/mindoc/views" ]; then mkdir -p "/mindoc/views"; fi
if [[ -z "$(ls -A -- "/mindoc/views")" ]]; then cp -r "/mindoc/__default_assets__/views" "/mindoc/"; fi

if [ ! -d "/mindoc/uploads" ]; then mkdir -p "/mindoc/uploads"; fi
if [[ -z "$(ls -A -- "/mindoc/uploads")" ]]; then cp -r "/mindoc/__default_assets__/uploads" "/mindoc/"; fi

# 如果配置文件不存在就复制
cp --no-clobber /mindoc/conf/app.conf.example /mindoc/conf/app.conf

# ===== 新增：用环境变量覆盖配置文件 =====
CONFIG_FILE="/mindoc/conf/app.conf"

# 设置数据库路径（优先使用环境变量）
if [ -n "${MINDOC_DB_DATABASE:-}" ]; then
  sed -i "s|db_database = .*|db_database = $MINDOC_DB_DATABASE|" "$CONFIG_FILE"
fi

# 设置数据库适配器
if [ -n "${MINDOC_DB_ADAPTER:-}" ]; then
  sed -i "s|db_adapter = .*|db_adapter = $MINDOC_DB_ADAPTER|" "$CONFIG_FILE"
fi

# 设置端口
if [ -n "${HTTP_PORT:-}" ]; then
  sed -i "s|httpport = .*|httpport = $HTTP_PORT|" "$CONFIG_FILE"
fi

# 设置运行模式
if [ -n "${MINDOC_RUN_MODE:-}" ]; then
  sed -i "s|runmode = .*|runmode = $MINDOC_RUN_MODE|" "$CONFIG_FILE"
fi

# 启用导出
if [ "${MINDOC_ENABLE_EXPORT:-}" = "true" ]; then
  sed -i "s|enable_export = .*|enable_export = true|" "$CONFIG_FILE"
fi
# =======================================

# 数据库等初始化
/mindoc/mindoc_linux_amd64 install

# 运行
/mindoc/mindoc_linux_amd64
