Middleware
==========

Why?
----

The Coach product has a dependency on recorder data.  To get this data into Coach it pulls data from a recorder by SOA.  This process can involve many hours of coding for each recorder and end client.

What problem does this solve?
-----------------------------

Remove your reliance on Qualtrak to bring changes to your api into production.  Facilitates a robust approach to supporting mulitple deployments through use of Inversion of Control ``IoC``.

How does it solve it?
---------------------

To help decouple the Coach product from the recorder by the implementation of RESTful service and Inversion of Control.

IoC Container
~~~~~~~~~~~~~

In software engineering, inversion of control (IoC)  [#f1]_  describes a design in which custom-written portions of a computer program receive the flow of control from a generic, reusable library.  Martin Fowler walks you through an implementation [#f2]_ and compares IoC with DI here [#f3]_.  Dependency Injection (DI) is another programming pattern. 

RESTful API
~~~~~~~~~~~

In computing, Representational State Transfer (REST) is a software architecture style for building scalable web services [#f4]_ .


.. rubric:: Footnotes

.. [#f1] https://en.wikipedia.org/wiki/Inversion_of_control - Wikipedia
.. [#f2] http://www.martinfowler.com/articles/injection.html - Martin Fowler
.. [#f3] http://martinfowler.com/bliki/InversionOfControl.html - Martin Fowler
.. [#f4] https://en.wikipedia.org/wiki/Representational_state_transfer - Wikipedia
