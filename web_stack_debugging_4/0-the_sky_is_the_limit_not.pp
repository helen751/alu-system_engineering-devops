# Fix nginx under heavy load by increasing file descriptors and worker connections

exec { 'fix--for-nginx':
  command => 'sed -i "s/worker_connections 768;/worker_connections 4096;/" /etc/nginx/nginx.conf && service nginx restart',
}
