export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"

# Matter CLI
export PATH="/Users/flowthought/.matter/bin:$PATH"

# mlx_lm.chat shortcuts
mc() {
  local model
  case "$1" in
    magnum)  model="mlx-community/magnum-v4-72b-4bit" ;;
    cydonia) model="mlx-community/Cydonia-24B-v3-4bit" ;;
    dolphin) model="mlx-community/Dolphin-Mistral-24B-Venice-Edition-mlx-8Bit" ;;
    q4) model="mlx-community/Qwen3.8-27B-4bit" ;;
    q6) model="lmstudio-community/Qwen3.8-27B-MLX-6bit" ;;
    q8) model="mlx-community/Qwen3.8-27B-8bit" ;;
    *) echo "mc: unknown model '$1' (options: magnum, cydonia, dolphin, q4, q6, q8)" >&2; return 1 ;;
  esac
  shift
  mlx_lm.chat --model "$model" -m 512 --temp 0.7 "$@"
}
