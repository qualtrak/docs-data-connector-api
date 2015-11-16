========================
SendEvaluationScoreAsync
========================

This method provides the mechanism to update your own data repository with Headline Scores assigned to an evaluation.

.. code-block:: c#
   :linenos:

   public Task SendEvaluationScoreAsync(SendEvaluationScoreArgs args, DataConnectorProperties properties)


:ref:`SendEvaluationScoreArgs <SendEvaluationScoreArgs-label>`
	This POCO is used to wrap the evaluation score information that is destined for the recorder.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


This does not return anything.
