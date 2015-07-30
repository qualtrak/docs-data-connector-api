.. dataconnectorapi documentation master file, created by
   sphinx-quickstart on Tue Jul 28 17:15:32 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Data Connector Api's documentation!
============================================

Contents:

.. toctree::
   :maxdepth: 1
   
   qualtrak
   middleware
   gettingstarted
   restfulapi
   controllers
   poco
   releasehistory
   license

.. note::

    The is a RESTful implementation.
    Code is written with c#  

.. code-block:: c#
   :linenos:
   :emphasize-lines: 3,3
    
    public class api
    {
        var agent = new Agent();
    }
  


    
The paragraph (ref) is the most basic block in a reST document. Paragraphs are simply chunks of text separated by one or more blank lines. As in **Python**, indentation is significant in reST, so all lines of the same paragraph must be left-aligned to the same level of indentation.      

  The paragraph (ref) is the most basic block in a reST document. Paragraphs are simply chunks of text separated by one or more blank lines. As in ``Python``, indentation is significant in reST, so all lines of the same paragraph must be left-aligned to the same level of indentation.
.. This is a comment.

       
=====  =====  =======
A      B      A and B
=====  =====  =======
False  False  False
True   False  False
False  True   False
True   True   True
=====  =====  =======    


+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+


.. list-table:: Frozen Delights!
   :widths: 15 10 30
   :header-rows: 1

   * - Treat
     - Quantity
     - Description
   * - Albatross
     - 2.99
     - On a stick!
   * - Crunchy Frog
     - 1.49
     - If we took the bones out, it wouldn't be
       crunchy, now would it?
   * - Gannet Ripple
     - 1.99
     - On a stick!
     
     
   
.. HINT::
   Beware killer rabbits!
   
* this is
* a list

  * with a nested list
  * and some subitems

* and here the parent list continues


term (up to a line of text)
   Definition of the term, which must be indented

   and can even consist of multiple paragraphs

next term
   Description.
   
   
This is a normal text paragraph. The next paragraph is a code sample::

   It is not processed in any way, except
   that the indentation is removed.

   It can span multiple lines.

This is a normal text paragraph again.


.. code-block:: python
   :linenos:
   
    def some_function():
       interesting = False
       print 'This line is highlighted.'
       print 'This one is not...'
       print '...but this one is.'  
       
.. literalinclude:: default.rb
   :language: ruby
   :emphasize-lines: 12,15-18
   :linenos:       
   
