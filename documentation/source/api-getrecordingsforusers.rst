GetRecordingsForUsers
=====================

This method is to return a list of recordings information

.. code-block:: c#
   :linenos:

	public List<RecordingInfo> GetRecordingsForUsers(int limit, string tenantCode,
		List<string> userIds, List<SearchCriteria> searchCriteria, string username,
		string password)


limit
	This is the maximum recordings per agent to return. For instance, if this value is 10 and there are 50 recordings found for this agent, 40 recordings must not be returned.

tenantCode
	The is a unique identifier as used by **Coach**. An example is ``1000``.

userIds
	A **List** of unique identifiers originating from the recorder to get recordings for.

:ref:`SearchCriteria-label`
	A **List** fo search crtieria to filter to recordings on.

username
	This is the username of the user who is currently signed into **Coach**.

password
	This is the clear text password of the user who is currently signed into **Coach**.

Please return a **List** of :ref:`RecordingInfo-label` objects.

You can also return other metadata.  This metadata will be displayed in **Coach**, next to the evaluation information when in an evaluation.  The format of this metadata must adhere to the following json schema:

 .. code-block:: json
   :linenos:

   {
	  metadata:
	    [
	      {
	        "label" : "Policy No",
	        "value" : "23126603039",
	        "field" : "policy_no",
	        "type" : "number"
	      },
	      {
	        "label" : "Notes",
	        "value" : "Caller said they were happy with resolution",
	        "field" : "call_notes",
	        "type" : "string"
	      }
	    ]
	}

The above ``metadata`` json must be inserted into the returning ``RecordingInfo.Metadata`` object property.  There is no limitation on the amount of metadata you supply.

This is how it the above looks in the Evaluation form:

.. image:: /images/evaluation-metadata.PNG
   :alt: alternate text
   :align: center


===========================
:ref:`SearchCriteria-label`
===========================

The Search Criteria is a filter that is to be applied yours recordings.  If called from the Evaluation form, it is possible that no filter is supplied. If however, it is called from the **Schedule** then there will always be at least 2 criteria.
