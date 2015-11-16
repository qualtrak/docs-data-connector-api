RESTful implemetation
=====================

This illustration shows the relationship between the api and the deployment process of the Coach product:

.. image:: /images/coachintegrationdiagram.PNG
   :alt: alternate text
   :align: center

In the above illustration you see the ``Coach`` product.  ``Coach`` calls on end points [e.g. users] to either pull or push data.

These end points in turn will call out to a recorder via a ``Connector`` implementation.  The ``Connector`` implementation will be code that you specifically write to talk to your recorder.  In this ``Connector`` you will (a) reference your own api and (b) interpret that data [e.g. search criteria] that is being passed from the RESTful end point.

The last [far right] part of this illustration explains how you test your implementation and what part this plays during the installation.


Plug your own (or other 3rd party) API into middleware
------------------------------------------------------

The RESTful API is the container that you use to hook into a ``connector``.  The ``connector`` has the bare minimum to manage the communication with the RESTful API.  However, if the ``connector`` requires a new method then this is completely in your control.  You have the freedom to modify the caller [RESTful API code base] as well as the callee [connector].

Target different deployments
----------------------------

This robust RESTful API approach not only offers you a way to quickly code transactions with your api but the other benefit is removes the complexity of using minor permutations of your api with different end-clients through the use of IoC.

Controllers
-----------

What follows is a short description of each of the RESTful API end points:

:ref:`Connectors <controller-connector-label>`
	Used to test connectivity

:ref:`Users <controller-users-label>`
	A user from the Recorder

:ref:`Recordings <controller-recordings-label>`
	Either a list of recordings or the url of a single recording

:ref:`Score <controller-score-label>`
	Pass evaluated recording scores back to your recorder system

:ref:`Stream <controller-stream-label>`
	A proxy to download the recording to a media player


Handlers
--------

:ref:`basicauthhandler-label`
	A proxy to download the recording when needing to satisfy a Basic Authentication challenge
