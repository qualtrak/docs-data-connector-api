Create your Connector
=====================

Here you will be shown how to build and test your ``connector``.

=========================
How to create a connector
=========================

Add a new project to your Visual Studio solution.  For ease, reuse the QATestRecorder code but remove all the code in the methods and leaving the method signatures in play. 

I have created a new connector and called the project ``recorder-abc`` with the namespace of ``ABCRecorder``:

.. image:: /images/my-recorder.PNG      
   :alt: alternate text
   :align: center
   
==================================
How to interpret method parameters
==================================

.. important::

	When a Schedule is being processed the username and password parameters are those that have been configured for your recorder. When a search is run from the Evaluation Form, the username and password are those of the user that is currently logged in.



Connector methods:

.. toctree::
   :titlesonly:

   api-getusers
   api-getrecordingsforusers
   api-getrecordingurl
   api-getstream   
   api-postevaluationscore
   
   
 
.. important::

	When you have built your recorder, copy its binary and any other binary that is required into the **data-connector-api\\bin** folder before you host the DataConnector

  
