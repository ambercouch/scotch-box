
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

				# /*=====================================
    # =            FREE VERSION!            =
    # =====================================*/
    # This is the free (still awesome) version of Scotch Box.
    # Please go Pro to support the project and get more features.
    # Check out https://box.scotch.io to learn more. Thanks


    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"

    # AC : Optimised Scotch Box for speed
       config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666", 'vers=3', 'tcp', 'fsc' ,'actimeo=2'] }

   				config.vm.provider "virtualbox" do |v|
   								v.memory = 4096
   								v.cpus = 4
   				end

    config.vm.provision "shell", inline: <<-SHELL

        ## Only thing you probably really care about is right here
        DOMAINS=("acwordpress" "acwordpressmulti" "acwordpressact" "acwordpresscomp" )


        ## Loop through all sites
        for ((i=0; i < ${#DOMAINS[@]}; i++)); do

            ## Current Domain
            DOMAINNAME=${DOMAINS[$i]}
            DOMAIN=$DOMAINNAME".local"

												## Create project database
            mysql -u root -proot -e "CREATE DATABASE $DOMAINNAME;"

            echo "Creating directory for $DOMAIN..."
            mkdir -p /var/www/$DOMAIN/public

            echo "Creating vhost config for $DOMAIN..."
            sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$DOMAIN.conf

            echo "Updating vhost config for $DOMAIN..."
            sudo sed -i s,webmaster@localhost,webmaster@$DOMAIN,g /etc/apache2/sites-available/$DOMAIN.conf
            sudo sed -i s,/var/www/public,/var/www/$DOMAIN/public,g /etc/apache2/sites-available/$DOMAIN.conf
												sudo sed -i "3i\
                        ServerName $DOMAIN
                        " /etc/apache2/sites-available/$DOMAIN.conf

            echo "Enabling $DOMAIN. Will probably tell you to restart Apache..."
            sudo a2ensite $DOMAIN.conf

            echo "So let's restart apache..."
            sudo service apache2 restart

        done

    SHELL

end