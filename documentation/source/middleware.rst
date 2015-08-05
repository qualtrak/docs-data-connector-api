Middleware
==========

The following sections talk you through the reason why we have done what have done in the way we have done it.

Why?
----

The :ref:`Coach <whatiscoach-label>` product has a dependency on user and recording metadata. In order for Coach to obtain this data it reaches out to the Recorder via Service Orientated Architecture ``SOA``.  The reason for this api documentation is to show and help you work through this process.
  
What problem does this solve?
-----------------------------

When one computer application requires information from another, we generally create an api to make this possible.  We have chosen to create a RESTful api to act as the intermeditary between our system and yours. This approach enables a decoupling between the two systems, removing your reliance on Qualtrak to bring any changes from your api into production.  

How does it solve it?
---------------------

We manage the decoupling programmatically through the use of the Inversion of Control ``IoC`` pattern.

IoC Container
~~~~~~~~~~~~~

In software engineering, inversion of control (IoC)  [#f1]_  describes a design in which custom-written portions of a computer program receive the flow of control from a generic, reusable library.  Martin Fowler walks you through an implementation [#f2]_ and compares IoC with DI here [#f3]_.  Dependency Injection (DI) is another programming pattern. 

RESTful API
~~~~~~~~~~~

In computing, Representational State Transfer (REST) is a software architecture style for building scalable web services [#f4]_ .

In this section we talk in more detail about our RESTful api that acts as the conduit between the 2 respective systems:

.. toctree::
   :titlesonly:
	
   restfulapi

.. rubric:: Footnotes

.. [#f1] https://en.wikipedia.org/wiki/Inversion_of_control - Wikipedia
.. [#f2] http://www.martinfowler.com/articles/injection.html - Martin Fowler
.. [#f3] http://martinfowler.com/bliki/InversionOfControl.html - Martin Fowler
.. [#f4] https://en.wikipedia.org/wiki/Representational_state_transfer - Wikipedia
