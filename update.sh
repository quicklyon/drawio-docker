#!/bin/bash

# Info   : Drawio version check and docker image build
# Author : zhouyq zhouyueqiu@easycorp.ltd
# CTime  : 2023.1.3

# shellcheck disable=SC1091

. ubuntu/prebuildfs/opt/easysoft/scripts/liblog.sh

TODAY=$(date +%Y%m%d)
REPO_URL="https://api.github.com/repos/jgraph/drawio/releases/latest"
RAW_URL="https://raw.githubusercontent.com/jgraph/drawio"

MATE_INFO=$(curl -s -L $REPO_URL)
LATEST_VER=$( echo "$MATE_INFO" | jq -r .tag_name | sed 's/^v//')
export LATEST_VER

TITLE=$( echo "$MATE_INFO" | jq -r .name)
export TITLE

CURRENT_VER=$( cat VERSION)
export CURRENT_VER

GITURL=$(jq -r .GitUrl app.json)
export GITURL

# generate new version changelog
gen_changelog(){
  info "Generate changelog/${TODAY}.md ..."
  BODY=$(curl -sLk ${RAW_URL}/v"${LATEST_VER}"/ChangeLog | grep -B 9999 "${CURRENT_VER}" | sed "/${CURRENT_VER}/d")
  export BODY

  sleep 2
  render-template .template/changelog.md.tpl > changelog/"${TODAY}".md && cat changelog/"${TODAY}".md
}

# 镜像tag模板增加新版本信息
add_newtag(){
  ver=${1:?latest version is error}
  oldver=${2:?old version is error}
  info "Add new tag to 03-release-tags.md ..."
  tag_exist=$(grep "$ver-$TODAY" .template/03-release-tags.md)
  
  # 如果tag不存在，添加新tag
  if [ "$tag_exist" == "" ];then
	# 修改latest的url
	sed -i "2s/$oldver/$ver/" .template/03-release-tags.md

	# 添加新tag
    sed -i "2 a - [$ver-$TODAY]($GITURL/releases/tag/v$ver)" .template/03-release-tags.md
  fi

  cat .template/03-release-tags.md
}
#====== main =======
if [ "$LATEST_VER" != "$CURRENT_VER" ];then
  info "Drawio new version->$LATEST_VER was detected."
  
  # 将新版本写入到版本文件
  echo "$LATEST_VER" > VERSION
  
  # 生成changelog文件
  gen_changelog

  # 生成镜像tag文档
  add_newtag "$LATEST_VER" "$CURRENT_VER"
  
  # 更新readme文档
  q-render-readme
  
  # 构建镜像，并提交代码
  make build \
  && make smoke-test \
  && git add . \
  && git commit -m "Drawio update to $LATEST_VER" \
  && git push \
  && gh release create v"${LATEST_VER}-${TODAY}" -F changelog/"$TODAY".md
else
  info "$CURRENT_VER is the latest version."
fi
