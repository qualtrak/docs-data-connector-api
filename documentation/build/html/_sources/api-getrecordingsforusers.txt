GetRecordingsForUsers
=====================

.. code-block:: c#
   :linenos:
   
	public List<RecordingInfo> GetRecordingsForUsers(int limit, string tenantCode, 
		List<string> userIds, List<SearchCriteria> searchCriteria, string username, 
		string password)


limit
	This is the maximum recordings per agent to return. For instance, if this value is 10 and there are 50 recordings found for this agent, 40 recordings must not be returned.
	
tenantCode
	The is a unique identifier as used by Coach. An example is ``1000``.
	
userIds
	A **List** of unique identifiers originating from the recorder to get recordings for.
	
:ref:`SearchCriteria-label`
	A **List** fo search crtieria to filter to recordings on.

username
	This is the username of the user who is currently signed into Coach.
	
password
	This is the clear text password of the user who is currently signed into Coach.

Please return a **List** of :ref:`RecordingInfo-label` objects. 
