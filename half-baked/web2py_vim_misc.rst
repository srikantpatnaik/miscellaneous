Steps to run a webapp on server to host low cost home automation
================================================================

#. Installed web2py in ~/tmp/web2py

#. Install required dependencies ::

	 apt-get install mysql-server python-mysqldb python-dev python2.7-dev libmysqlclient-dev

#. On a server terminal run ::
	
	mysql -u root -p

#. Create a database, in mysql prompt, type ::

	create database ha_db;

#. Add permission to desired user, change the password 'homeauto' while deploying on server::

	GRANT ALL ON ha_db.* TO srikant@localhost IDENTIFIED BY 'homeauto';

#. Started a web2py server and added new webapp name 'autohome' from interface

#. Open admin interface for 'autohome' app, and edit `models/db.py` file, modify following content,
    where `srikant` is username, and `homeauto` is password ::

	db = DAL('mysql://srikant:homeauto@localhost/ha_db')

#. Note: If something goes wrong, clear the `db/` directory inside `applications/autohome/db`, and 
   recreate the database from mysql prompt. 	

#. The other settings in `db.py` is only required when its actually deployed, so let's ignore
   it for now. 

#. Edit `menu.py`, and comment unnecessary stuff, also make development menu off ::

	DEVELOPMENT_MENU = False

#. In controllers, edit `default.py`, add ::

	@auth.requires_login()

   Above each function which you want to be exposed only if user login, especially over
   `def index():` 

#. Edit `views/default/index.html` and remove unwanted stuff

#. Edit `views/layout.html` and comment text 'Right Sidebar', you may also comment the 
   footer block

#. To add custom field in profile, just add this line in `db.py` ::

	auth.settings.extra_fields['auth_user'] = [Field('unique_home_id','string',requires=IS_NOT_EMPTY())]

#. To allow console based login, first add the following in `db.py` under configure auth policies ::

	auth.settings.allow_basic_login = True

#. Then in controllers use the following code to allow plain login ::

	def give_me_time():
    import time
    auth.basic()
    if auth.user:
        return time.ctime()
    else:
        return 'Not authorized'

#. To remove a row from mysql table, use inside mysql prompt ::

	DELETE FROM comm where id=4;

#. To update a `custom auth_user` entry, use similar syntax ::

	if str(auth.user_id)==str(light.logged_in_user_id):
           db(db.auth_user.id == auth.user_id).update(sendString=str(light.device_id) + str(light.State))

#. To run `ipython` or `bpython` with all the modules imported, use for ipython (add `-B` for bpython) ::

	python web2py.py -S buttons -M

#. Curl command to check the protected page ::
	
	curl --user srikant:chinto http://127.0.0.1:8000/buttons/default/api/get_status

#. ** If pyserial tries to connect write some data, Arduino gets reset. The reset 
   operation will make it boot again, and will take ~2seconds. 
   Its better to put delay after `serial.Serial` command or add code to write to 
   the serial port, in setup, and have the python script wait for serial data to 
   be sent to it before it sends out serial data.

#. To set proper indentation, at last run `:ret` in vim for Python











