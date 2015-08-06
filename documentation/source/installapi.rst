Install API
===========

.. note::

    You will need Visual Studio 2013 and PostMan

===============================
Download RESTful api middleware
===============================

Create a blank solution, ``e.g. integrations``. At the command line cd in the directory Visual Studio created.

Create a sub folder named ``src``.  ``cd`` into this folder.

You can clone the ``dataconnector`` git repository by:

.. code-block:: xml

	git clone git@github.com:qualtrak/data-connector-api.git

Next, please clone our sample recorder connector. This connector is what we use for QAing with:

.. code-block:: xml

	git clone git@github.com:qualtrak/recorder-qa.git


Your folder structure will now look like this:

.. image:: /images/solution-structure.PNG
   :alt: sample solution
   :align: center

Next, add these 2 projects. Your solution will look similar to this:

.. image:: /images/new-solution.PNG
   :alt: sample solution
   :align: center

.. hint::

   If you are prompted to restore packages from nuget, accept.


==================
Build the solution
==================

Select the solution name in the ``Solution Explorer``, right-click and ``enable Nuget``

.. hint::

    If you get an nuget error at this stage, clear the nuget cache by:

        :menuselection:`Menu --> Tools --> Options --> Nuget Package Manager --> General --> Clear Package Cache`

Now build the solution.

Next, navigate to the **recorder-qa\\bin\\Debug** folder and copy the ``QATestRecorder.dll`` binary then paste it into **data-connector-api\\bin** folder.

.. important::

    When you develop your own recorder you must update the mappings in the ninject.xml file.  More on this later.

We don't have to change the ninject.xml file now as the default contains the mappings to this QATestRecorder assembly.

Finally, rebuild the solution.  You are now ready to run and serve up the DataConnector RESTful api.

===================================
Confirm middleware deployment works
===================================

Expand the Controllers folder in DataConnector project and open the ConnectorsController class.  Place a brakepoint on the Get method.

Select the DataConnect project, right-click and ``Set as StartUp Project``. Now run the solution

Copy the address, in my example it is ``http://localhost:20908/api/connector``, into PostMan and press ``Send``:

.. image:: /images/postman-get-connector.PNG
   :alt: alternate text
   :align: center

You'll see the breakpoint hit:

.. image:: /images/connector-controller-brakepoint-hit.PNG
   :alt: alternate text
   :align: center

**Well done!!** You have successfully downloaded, restored the required nuget packages, built and run the data connector middleware and hit a breakpoint into the sample recorder connector.
