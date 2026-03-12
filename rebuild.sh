#!/usr/bin/env bash
set -e  # 出现错误立即退出

# 1️⃣ 重建系统配置
echo "🔧 Rebuilding NixOS system..."
sudo nixos-rebuild switch --flake ~/nixos#wang

# 2️⃣ 构建 Home Manager 用户配置
echo "🛠️ Building Home Manager user configuration..."
nix build ~/nixos#homeConfigurations.wang.activationPackage

# 3️⃣ 激活 Home Manager 配置
echo "🚀 Activating Home Manager..."
./result/activate

echo "✅ System + Home Manager configuration applied successfully!"

