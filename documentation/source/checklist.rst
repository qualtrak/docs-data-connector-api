.. _checklist-label:

=========
Checklist
=========


Prior to integration
====================

- [✔] Watched all the videos for solid understanding of what's involved
- [✔] Read the :ref:`Checklist <beforeyoustartlabel>` section
- [✔] Read the :ref:`Checklist <gettingstarted-label>` section
- [✔] Subscribed to the Coach `Service Desk <https://qualtrak.atlassian.net/servicedesk/customer/portal/7/>`_
- [✔] Obtained public facing IP address for the Integration Tool to test your Data Connector
- [✔] Added port of Data Connector RESTful API before to firewall
- [✔] Added this IP range (23.100.53.139,23.100.53.152,23.100.53.156,23.100.58.69) to your firewall so Integration Tool can reach your Data Connector 

Server configuration
====================

- [✔] Installed `Chef Client 12.2.1 <https://downloads.chef.io/chef-client/windows/>`_.
- [✔] Run  :ref:`Chef script <server-deploy-label>` on server to configure your server prior to Coach install

Coding
======

- [✔] Downloaded `Data Connector RESTful API <https://github.com/qualtrak/data-connector-api>`_ from github
- [✔] Downloaded `QA Data Connector <https://github.com/qualtrak/recorder-qa>`_ from github to look at sample implementation
- [✔] Implemented Data range in both ``GetMediaForUserAsync`` and ``GetMediaForUsersAsync`` so results are filtered on a period
- [✔] Incorporated the Limit property in and :ref:`MediaForUserArgs <MediaForUserArgs-label>` and :ref:`MediaForUsersArgs <MediaForUsersArgs-label>` so as to not return potentially millions of rows of data
- [✔] Received Email with link back to recorder configuration
- [✔] Clicked on link included in Email and returned to recorder configuration
- [✔] Tested :ref:`users import <test-users-label>` in Integration Tool 
- [✔] Tested :ref:`search criteria <test-recordings-label>` in Integration Tool

Post-coding
===========

- [✔] Completed Integration Tool and have received T-SQL script file Email attachment
- [✔] Installed Coach 

Support
=======

- [✔] Received training on Coach




