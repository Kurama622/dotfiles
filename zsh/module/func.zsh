source ~/.config/zsh/.env

export ACCOUNT=$WORKERS_AI_ACCOUNT
export LLM_KEY=$SILICONFLOW_TOKEN

enable_workers_ai() {
  export LLM_KEY=$WORKERS_AI_KEY
}

enable_glm() {
  export LLM_KEY=$GLM_KEY
}

enable_kimi() {
  export LLM_KEY=$KIMI_KEY
}

enable_gpt() {
  LLM_KEY=$GITHUB_TOKEN
}

enable_siliconflow() {
  export LLM_KEY=$SILICONFLOW_TOKEN
}
enable_openai() {
  export LLM_KEY=$OPENAI_KEY
}

fetch_github_repo_info() {
  repo_info=$(curl -s https://api.github.com/repos/kurama622/llm.nvim -H "Authorization: Bearer $GITHUB_TOKEN")
  echo stars: && echo $repo_info | jq '.stargazers_count'
  echo ' ' && echo forks: && echo $repo_info | jq '.forks'
}

# echo_github_repo_info() {
#   read stars forks < <(fetch_github_repo_info)
#   echo "============= llm.nvim ============="
#   echo "star: $stars fork: $forks"
# }

enable_repo_info() {
  export INFO=true
}

disable_repo_info() {
  export INFO=''
}
