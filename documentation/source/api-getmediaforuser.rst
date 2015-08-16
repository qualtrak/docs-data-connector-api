====================
GetMediaForUserAsync
====================

This method is to return a list of **Media** which is the minimum list of information that is required by our randomizer. Our randomizer chooses which recordings **Coach** will accept from the batch supplied.

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<Media>> GetMediaForUserAsync(string userId, MediaForUserArgs args, DataConnectorProperties properties)

userId
    The Id of the user originating from the Recorder.

:ref:`MediaForUsersArgs <MediaForUsersArgs-label>`
	Used to store all the information required by the Recorder to perform a search for recordings for a list of users.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Used to store user credentials required for an authentication challenge at the recorder end point.


Please return a **IEnumerable** of :ref:`Media-label` objects.
