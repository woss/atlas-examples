if [ -s "ssh_keys/metamon-key.pem" ] && [ -s "ssh_keys/metamon-key.pub" ] && [ -z "$1" ]; then
    echo Using existing metamon key pair
else
    rm -rf ssh_keys/metamon-key*
    if [ -z "$1" ]; then
        echo No metamon key pair exists and no private key arg was passed, generating new keys
        openssl genrsa -out ssh_keys/metamon-key.pem 1024
        chmod 400 ssh_keys/metamon-key.pem
        ssh-keygen -y -f ssh_keys/metamon-key.pem > ssh_keys/metamon-key.pub
    else
        echo Using private key $1 for metamon key pair
        cp $1 ssh_keys/metamon-key.pem
        chmod 400 ssh_keys/metamon-key.pem
        ssh-keygen -y -f ssh_keys/metamon-key.pem > ssh_keys/metamon-key.pub
    fi
fi

if [ -s "ssh_keys/consul-key.pem" ] && [ -s "ssh_keys/consul-key.pub" ] && [ -z "$1" ]; then
    echo Using existing consul key pair
else
    rm -rf ssh_keys/consul-key*
    if [ -z "$1" ]; then
        echo No consul key pair exists and no private key arg was passed, generating new keys
        openssl genrsa -out ssh_keys/consul-key.pem 1024
        chmod 400 ssh_keys/consul-key.pem
        ssh-keygen -y -f ssh_keys/consul-key.pem > ssh_keys/consul-key.pub
    else
        echo Using private key $1 for consul key pair
        cp $1 ssh_keys/consul-key.pem
        chmod 400 ssh_keys/consul-key.pem
        ssh-keygen -y -f ssh_keys/consul-key.pem > ssh_keys/consul-key.pub
    fi
fi
