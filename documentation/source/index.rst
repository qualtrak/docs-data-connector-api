.. dataconnectorapi documentation master file, created by
   sphinx-quickstart on Tue Jul 28 17:15:32 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Data Connector API documentation!
============================================

.. note::

    The is a RESTful implementation. Code is written in c#

Contents:

.. toctree::
   :maxdepth: 1
   :caption: Important

   before-you-start
   checklist

.. toctree::
   :maxdepth: 1
   :caption: Implementation

   gettingstarted
   concept
   controllers
   poco
   enums

.. toctree::
   :maxdepth: 1
   :caption: Configuration

   server

.. toctree::
   :maxdepth: 1
   :caption: Other

   releasehistory
   qualtrak
   license
   appendix


The :ref:`gettingstarted-label` section   is the best place to start if you are a developer tasked with the job of integrating your recorder with **Coach**.

In this :ref:`gettingstarted-label` section you will be guided through how to:

* obtain the RESTful api middleware
* confirm that the middleware deployment is correct
* build search criteria with our `Integration Tool <http://dev.qualtrak.com/Cit>`_
* create your connector
* test your search criteria with your new middleware
* generate an artefact required during the installation of **Coach**
