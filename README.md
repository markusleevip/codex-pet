# Codex Pets

可直接安装到 Codex 的 v2 桌面宠物集合。

当前宠物：`Scarlet Gunner`（女枪）。后续宠物放到 `pets/<pet-id>/` 下即可由安装脚本一起安装。

## 一键安装

在本仓库目录执行：

```sh
./install.sh
```

脚本会扫描 `pets/*/` 下的宠物包，并分别安装到：

```text
${CODEX_HOME:-$HOME/.codex}/pets/<pet-id>/
```

如果当前 Codex app 已经打开，安装后刷新或重启 Codex，使宠物列表重新加载。

也可以覆盖安装到自定义 Codex 目录：

```sh
CODEX_HOME=/path/to/.codex ./install.sh
```

## 当前包内容

- `pets/scarlet-gunner/pet.json`：Codex pet manifest，使用 `spriteVersionNumber: 2`
- `pets/scarlet-gunner/spritesheet.webp`：最终 `8x11` v2 atlas，尺寸 `1536x2288`，单元格 `192x208`
- `pets/scarlet-gunner/SHA256SUMS`：当前宠物文件完整性校验
- `install.sh`：跨 macOS/Linux 的安装脚本

## 手动安装

如果不使用脚本，将当前宠物的两个文件放到以下目录即可：

```text
${CODEX_HOME:-$HOME/.codex}/pets/scarlet-gunner/pet.json
${CODEX_HOME:-$HOME/.codex}/pets/scarlet-gunner/spritesheet.webp
```

## 校验

在 macOS/Linux 上可以执行：

```sh
(cd pets/scarlet-gunner && shasum -a 256 -c SHA256SUMS)
```

该包已在生成环境完成 v2 atlas 校验：8×11 布局、`1536x2288`、透明边缘残留为 0。
