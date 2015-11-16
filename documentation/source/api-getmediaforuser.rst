====================
GetMediaForUserAsync
====================

This method is to return a list of **Media**.

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<Media>> GetMediaForUserAsync(string userId, MediaForUserArgs args, DataConnectorProperties properties)

userId
    The Id of the user originating from the Recorder.

:ref:`MediaForUsersArgs <MediaForUsersArgs-label>`
	Used to store all the information required by the Recorder to perform a search for recordings for a list of users.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


Please return a **IEnumerable** of :ref:`Media-label` objects.

Additional information
~~~~~~~~~~~~~~~~~~~~~~

:ref:`Metadata <Metadata-label>`
    You can also return other data to **Coach** that is outside of the original search filter.

:ref:`SearchCriteria-label`
    The Search Criteria is a filter that is to be applied to your recordings.  If called from the Evaluation form, it is possible that no filter is supplied. If however, it is called from the **Schedule** then there will always be at least 2 criteria.
