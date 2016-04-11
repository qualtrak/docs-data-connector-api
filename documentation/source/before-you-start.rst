.. _beforeyoustartlabel:

================
Before you start
================

To help your integration go as smooth and trouble free as possible we have compiled this section.  Here we go into detail on those areas where we have received feedback on or have spent time working with our partners on questions posted via our `Service Desk <https://qualtrak.atlassian.net/servicedesk/customer/portal/7/>`_.

Please also review the :ref:`Checklist <checklist-label>` we have compiled to assist you in making sure you have all your ducks lined up before completing the integration.

Data Connector
==============

There are 2 essential properties you must code for in your Data Connector implementation.  These are: Date Range and Limit.  Their respective importance are explained below:

.. _bys_daterange_label:

----------
Date Range
----------

An IntelliSearch profile will always pass a date range to the Data Connector.  This range is based on 5 different period types: Daily, weekly, monthly, quarterly and custom.  Custom is a user defined date range.

It is therefore critical that you accommodate for a date range from within your code.  The most efficient way to do this via our Integration Tool by adding a date field in the Search Criteria panel and setting it’s condition to Range.  With doing this and placing a breakpoint in VS, you will see the data structure that constitutes a date range.

A date range consists of 2 searchCriteria items.  The Id of both items will be identical (this means both items are coupled) and the key will be the name you give to this field in the search criteria panel.

.. _bys_limit_label:

-----
Limit
-----

It is possible from within the Evaluation (~v6 Coach) to not supply a date range when searching for agent calls.

Without care, this will impact on your network bandwidth.  All items (an item = row of data) will be returned to Coach if you do not restrict the amount of data being returned.  This is why we include the Limit property.  By using this Limit property you can restrict the number of items being returned to Coach.

Please be aware that the Limit increases in line with the period type (when used in conjunction with the IntelliSearch feature) and is static when used from the Evaluation Form.  Do not use an arbitrary value here, please be sure to use our Limit value instead.

*Background information on search process:*


  We do take care by not requesting unnecessary data.  Let me give you an overview of the process.  A search is requested and a request is passed to the Data Connector.  The payload includes a limit, tenant code, list of agents and a list of search criteria.  The Data Connector will process the search criteria and return a list of IDs that reference a call and adhering to the provided limitation of items per agent.  Coach will then pipe this returned list through a randomisation algorithm.  The product of the algorithm is a list of IDs (per agent) based on the max number of calls per agent (a) stipulated in the IntelliSearch Profile OR (b) 100 (via Evaluation form only).  This list is then returned to the Data Connector.  The Data Connector will then return the call information for each of these IDs as well as any additional metadata you wish to see in Coach.


Integration Tool
================

Our Integration Tool is accessible via our developer portal.  It is not OSS and it cannot be installed locally [within your infrastructure].  The first task you’ll be invited to perform it to confirm connectivity to your hosted Data Connector - :ref:`Test your Connector <test-label>`.  You must enable a public facing IP address and port for the Integration Tool to be able to reach your Data Connector end-point.  You will not be able to progress through the Integration Tool until it has confirmed connectivity with the Data Connector.  Please note, this does not mean that you must have completed the development work at this point in time.

There are 1 of several outbound IP address the Integration Tool uses to communicate through so please add this list to your firewall:

- 23.100.53.139
- 23.100.53.152
- 23.100.53.156
- 23.100.58.69

If for security reasons you are unable to enable an IP and port then we suggest you deploy the Data Connector and your own Recorder repository to a cloud provider VM such as offer up by Azure or AWS.


Coach server environment
========================

To help you quickly and without any effort configure your server, we have prepared a Chef script for your convenience.  You will need to install Chef client version 12.2.1 first - https://downloads.chef.io/chef-client/windows/.  You can find this here - :ref:`Server deployment <server-deploy-label>`.
