# Increase Nginx limits so it can handle heavy load (ab -c 100 -n 2000)

exec { 'fix--for-nginx':
  command => '
    sed -i "s/worker_processes .*/worker_processes 4;/" /etc/nginx/nginx.conf &&
    sed -i "s/worker_connections .*/worker_connections 4096;/" /etc/nginx/nginx.conf &&
    echo "ulimit -n 10000" >> /etc/default/nginx &&
    service nginx restart
  ',
}
