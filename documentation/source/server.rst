.. _server-deploy-label:

=================
Server Deployment
=================

Chef
====

.. important::

  You will need to install Chef client version 12.2.1 first - https://downloads.chef.io/chef-client/windows/.

.. note::

    Minimum requirements are Windows Server 2012 R2, SQL Server 2014 and IIS 8


The following is a chef script.  Its purpose is to help you quickly preconfigure the server where Coach will be deployed:


.. literalinclude:: default.rb
   :language: ruby
   :linenos:


Cut & paste the above code into a file called ``setup.rb``. Open a command console ``as Administrator`` and enter:

.. code-block:: bash
  :linenos:

  c:\chef-apply setup.rb

This will now install all the server features required to host Coach on this server.
