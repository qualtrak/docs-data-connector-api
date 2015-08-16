.. _Metadata-label:

========
Metadata
========

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

This is how the above looks in the Evaluation form:

.. image:: /images/evaluation-metadata.PNG
   :alt: alternate text
   :align: center
