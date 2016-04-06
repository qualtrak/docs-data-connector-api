.. _server-deploy-label:

=================
Server Deployment
=================

Chef
====

The following is a chef script.  Its purpose is to help you quickly preconfigure the server where Coach will be deployed:

.. important::

  You will need to install Chef client version 12.2.1 first - https://downloads.chef.io/chef-client/windows/.

.. note::

    Minimum requirements are Windows Server 2012 R2, SQL Server 2014 and IIS 8

.. literalinclude:: default.rb
   :language: ruby
   :linenos:
