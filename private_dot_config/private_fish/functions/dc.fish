function dc --wraps=docker-compose --wraps=podman-compose --wraps=docker-compose. --wraps='docker compose' --description 'alias dc=docker compose'
  docker compose $argv
        
end
