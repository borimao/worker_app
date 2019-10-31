set :rails_env, "production"
set :unicorn_rack_env, "production"
set :pty, false # これをセットしないと、デプロイ時にSidekiqがデーモン起動しない…


# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '18.221.246.206', user: 'borimao', roles: %w{app db web} 

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/worker_key_rsa' 