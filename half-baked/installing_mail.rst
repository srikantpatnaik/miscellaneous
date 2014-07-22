Setting up mail server
======================

#. apt-get install postfix

#. internet site
   system mail name: thelinuxacademy.in ::

	go to bigrock -> dns settings -> change mx records to mail.linuxacademy.in and delete cname and txt records too


#. In server: vi /etc/aliases and add these contents ::

	postmaster:    root
	root:  u.srikant.patnaik@gmail.com
	info:  u.srikant.patnaik@gmail.com
	srikant:  u.srikant.patnaik@gmail.com

#. postaliases /etc/aliases

#. service postfix restart

#. test using::

	mail -s "IMP: Submission instructions for aakashlab project" -S from="info <info@linuxacademy.in>" "srikant@linuxacademy.in"  << 1.txt
