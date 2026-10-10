#!/usr/bin/env bash
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${RED}Uninstalling FakeFiller Linux...${NC}"

rm -f "$HOME/.local/bin/fakefiller"
rm -f "$HOME/.local/bin/mock"
rm -f "$HOME/.local/share/applications/fakefiller.desktop"

echo -e "${GREEN}✓ FakeFiller Linux has been removed.${NC}"
