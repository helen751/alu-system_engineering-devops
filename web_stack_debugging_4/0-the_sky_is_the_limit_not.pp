# Fixes Nginx under high load by increasing worker limits and file descriptors

exec { 'fix-nginx-performance':
  command => '
    sed -i "s/worker_processes .*/worker_processes 4;/" /etc/nginx/nginx.conf &&
    sed -i "s/worker_connections .*/worker_connections 4096;/" /etc/nginx/nginx.conf &&
    echo "ulimit -n 20000" >> /etc/default/nginx &&
    service nginx restart
  ',
}
