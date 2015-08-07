PostEvaluationScore
===================

This method provides the mechanism to update your own data repository with scored assigned to an evaluation.

.. code-block:: c#
   :linenos:

	public void PostEvaluationScore(string tenantCode, string username, string password,
		string evaluationId, string headlineScore, string extraScore, string userId,
		string recordingId)



tenantCode
	The is a unique identifier as used by **Coach**. An example is ``1000``.

username
	This is the username of the user who is currently signed into **Coach**.

password
	This is the clear text password of the user who is currently signed into **Coach**.

evaluationId
	This is a code originating from **Coach** that uniquely identifies a specific evaluation. 

headlineScore
	This is the headline score assgined by the Supervisor for a given evaluation

extraScore
	This is the extra score assgined by the Supervisor for a given evaluation

userId
	This unique identifies an agent and originates from the recorder

recordingId
	This unique identifies a recording and originates from the recorder


This does not return anything.
