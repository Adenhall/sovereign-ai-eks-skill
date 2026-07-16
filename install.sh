#!/usr/bin/env bash
# Install sovereign-ai-eks skill for Kiro AI or OpenCode
# Auto-detects installation paths

set -e

SKILL_NAME="sovereign-ai-eks"
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing $SKILL_NAME skill..."

# Detect Kiro AI installation
detect_kiro() {
    local kiro_paths=(
        "$HOME/.kiro/skills"
        "$HOME/.config/kiro/skills"
        "$HOME/Library/Application Support/Kiro/skills"
        "$LOCALAPPDATA/Kiro/skills"
    )
    
    for path in "${kiro_paths[@]}"; do
        if [ -d "$path" ]; then
            echo "$path"
            return 0
        fi
    done
    return 1
}

# Detect OpenCode installation
detect_opencode() {
    local opencode_paths=(
        "$HOME/.opencode/skills"
        "$HOME/.config/opencode/skills"
        "$HOME/.local/share/opencode/skills"
    )
    
    for path in "${opencode_paths[@]}"; do
        if [ -d "$path" ]; then
            echo "$path"
            return 0
        fi
    done
    return 1
}

# Install to detected path
install_to() {
    local target_dir="$1"
    local skill_target="$target_dir/$SKILL_NAME"
    
    echo "Installing to: $skill_target"
    mkdir -p "$skill_target"
    
    # Copy skill files
    cp -r "$SKILL_DIR/SKILL.md" "$skill_target/"
    cp -r "$SKILL_DIR/AGENTS.md" "$skill_target/"
    cp -r "$SKILL_DIR/references" "$skill_target/"
    
    echo "Skill installed successfully to $skill_target"
}

# Main installation logic
installed=false

if kiro_path=$(detect_kiro); then
    echo "Detected Kiro AI at: $kiro_path"
    install_to "$kiro_path"
    installed=true
fi

if opencode_path=$(detect_opencode); then
    echo "Detected OpenCode at: $opencode_path"
    install_to "$opencode_path"
    installed=true
fi

if [ "$installed" = false ]; then
    echo "No supported platform detected. Installing to default location..."
    default_path="$HOME/.local/share/skills"
    install_to "$default_path"
    echo ""
    echo "To use this skill, copy it to your platform's skills directory:"
    echo "  - Kiro AI: ~/.kiro/skills/$SKILL_NAME/"
    echo "  - OpenCode: ~/.opencode/skills/$SKILL_NAME/"
fi

echo ""
echo "Installation complete!"
echo "Invoke with: /sovereign-ai-eks"
