# HaProxy
Implementando HaProxy web server

Para el desarrollo de esta actividad se utiliza las siguientes máquinas virtuales:
 - Servidor web bajo nginx 
 - Servidor web bajo apache
 - Servidor HaProxy para balancear la carga 
 
 # Archivos:
 Vagranfile -> Es el archivo "main" sobre el cual se crean las Máquinas Virtuales.
 
 apache.sh  -> Es el archivo para aprovisionar un servidor web sobre una máquina virtual ya creada.
 
 html       -> Es la carpeta que contiene el código fuente para crear una página web en un servidor apache.
 
 hap.sh     -> Es el archivo para aprovisionar un servidor HaProxy sobre una máquina virtual 
 
 haproxy.cfg-> Es el archivo de configuración para el balanceador de carga sobre el cual se indica sobre que servidores va a trabajar y los puertos
 
 # Configuración
 
 *Vagrantfile*

Se crea una configuración con versión 2 pára los boxes ha utilizar. Con ello ya se puede crear una VM con el siguiente comando

 
Vagrant.configure("2") do |config|
  config.vm.define "web1" do |w|

Una vez definido el nombre de la VM se procede a configurarla previamente, sobre el cual se asigna una cantidad de RAM y CPU a la VM.


Se asigna una dirección IP con el siguiente comando :

      w.vm.network :private_network, ip: "192.168.33.11"
			
Se selecciona un SO que correrá la VM :

      w.vm.box = "bento/ubuntu-16.04"

Ahora se aprovisiona, lo cual significa que sobre la VM se corren un script para que pueda ya sea actualizarse o instalar algun servicio, en este caso
se instala un servidor web usando apache 

      w.vm.provision "shell" , path: "apache.sh"

Se asigna el puierto 8080 para poder ingresar desde nuestra máquina y validar operatividad de la página 

      w.vm.network "forwarded_port", guest:80, host: 8080
			
Por último, se asegura que la máquina virtual tenga conexión a la carpeta html donde se encuentra creada la p
       w.vm.provision "file", source: "html/index.html",
       destination: "/var/www/html/index.html"
  end

