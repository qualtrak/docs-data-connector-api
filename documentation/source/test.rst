===================
Test your Connector
===================

Here, we will walk you though how to test your connector when using our `Integration Tool <http://dev.qualtrak.com/Cit>`_ [#f1]_ .  You will need to host this end point.  You can do this though IIS and allowing port 80 through your firewall.  Your IP address or domain name will be required by our `Integration Tool <http://dev.qualtrak.com/Cit>`_.

.. image:: /images/basic-information.PNG
   :alt: alternate text
   :align: center

Next, you will be asked for the media player you wish to use.

Search Criteria Matrix
======================

Within Coach you have several different input types ``data types`` available to you that best describes the data you want to filter on.

See :download:`Search Criteria Matrix </pdfs/Search-Criteria-Matrix.pdf>` document for the data types and their conditions.

For more information on these data types see :ref:`Data Types <datatypes-label>`.

Build search criteria
======================

You can use our **Integration Tool** to construct your recorder's search criteria.

Here, you will see that we have defined the search criteria as having 3 fields; **Date Range**, **Part of campaign** and **Direction of call**.

.. image:: /images/search-criteria-defined.PNG
   :alt: alternate text
   :align: center

Test Users
==========

Open you connector code and place breakpoint just inside of the **GetUsers** method.

Whem you press the ``Test Users`` button you get presented with this modal and you press :kbd:`OK`

.. image:: /images/test-get-users-pre.PNG
   :alt: alternate text
   :align: center

It now hits your breakpoint. You will see ``1000`` is being passed as the **tenantCode**. You will see ``null`` for both username and password as the Integration Tool is not passing values for those.

.. image:: /images/test-get-users.PNG
   :alt: alternate text
   :align: center


Test Recordings
===============

Whenever you call upon your Data Connector to return a list of recordings, the process sequences through 2 stages.  The first stage requests a list of recordings with minimum data.  This list is then processed by our randomizer.  Once the randomizer has chosen which recordings it wants, it then calls the Data Connector a second time which is stage 2.  Stage 2 returns all the medatata data associated with the recordings.  These stages are shown next.  I have placed a breakpoint at the top of each method.

Stage 1
~~~~~~~

Open your connector code and place breakpoint just inside of the **GetRecordingsForUsers** method.

When you press the ``Test Media`` button you get presented with this modal and you press :kbd:`OK`

.. image:: /images/test-get-recordings-pre.PNG
   :alt: get recordings pre
   :align: center

It now hits your breakpoint. You first see a limit value. This is the maximum calls that Coach wants per agent. You will see ``1000`` is being passed as the **tenantCode**. Next you see that only 1 **userId* is passed.  Following this, you see that 4 search criteria have been passed. You will see `` `` for both username and password as the Integration Tool is not passing values for those.

.. image:: /images/test-get-recordings-1.PNG
   :alt: get recordings
   :align: center


There is only one user passed in

.. image:: /images/test-get-recordings-param-users.PNG
   :alt: get recordings param user
   :align: center

Here we see a 4 criteria in the **MediaForUsersArgs** listed

.. image:: /images/test-get-recordings-param-criteria-full.PNG
  :alt: get recordings param criteria
  :align: center

Here we see a 4 criteria listed

.. image:: /images/test-get-recordings-param-criteria.PNG
   :alt: get recordings param criteria
   :align: center

Here we see a the data connector credentials

.. image:: /images/test-get-recordings-param-creds.PNG
  :alt: get recordings param criteria
  :align: center

All criteria is expanded. Each criteria starts with an identifier, e.g. ``date_0``

.. image:: /images/test-get-recordings-param-criteria-expanded.PNG
   :alt: get recordings param criteria expanded
   :align: center

This is a description of the critiera being passed to your method:

Date Range
    The first 2 criteria here form the date range.  These come with conditions of GreaterthanEqual and LessThanEqual.  As these criteria share the same identifier ``date_0`` this denotes they refer to the same data input.

Part of campaign
    The next criteria identifier is ``is_campaign_0``. Here we see that the condition is Equal and that we are passing a boolean value. In this case, the **Integration Tool** is passing ``True``.

Direction of call
    The last criteria that is passed has the identifier of ``call_direction_0``. Again, this condition is Equal and the value being passed is ``I``.

Stage 2
~~~~~~~

Here you see the second method's breakpoint being hit:

.. image:: /images/test-get-recordings.PNG
   :alt: get recordings
   :align: center

Here is the list of media Ids being requested from the Data Connector after the randomization process has processed the original list:

.. image:: /images/test-get-recordings-param-media-ids.PNG
  :alt: get recordings
  :align: center




.. rubric:: Footnotes

.. [#f1] http://dev.qualtrak.com/Cit - **Integration Tool** in the developer portal
