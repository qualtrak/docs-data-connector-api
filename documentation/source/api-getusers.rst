GetUsers
========

This method is to return a list of Users. 

.. code-block:: c#
   :linenos:
	
	public List<RecorderUserInfo> GetUsers(string tenantCode, string username, string password)
	
tenantCode
	The is a unique identifier as used by Coach. An example is ``1000``.
		
username
	This is the username of the user who is currently signed into Coach.
		
password
	This is the clear text password of the user who is currently signed into Coach.

Please return a **List** of :ref:`RecorderUserInfo-label` objects. 