# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '18.221.246.206', user: 'borimao', roles: %w{app db web} 

#デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/worker_key_rsa' 

set :rails_env, "production"
set :unicorn_rack_env, "production"
set :pty, false # これをセットしないと、デプロイ時にSidekiqがデーモン起動しない…

role :app, %w{vagrant@192.168.33.40}
role :web, %w{vagrant@192.168.33.40}
role :db,  %w{vagrant@192.168.33.40}

server '192.168.33.40', user: 'vagrant', roles: %w{web app}

set :ssh_options, {
  keys: %w(/home/vagrant/.ssh/worker_rsa),
  forward_agent: false,
  auth_methods: %w(publickey)
}