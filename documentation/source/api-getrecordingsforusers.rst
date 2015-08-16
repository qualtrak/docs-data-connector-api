=====================
GetMediaForUsersAsync
=====================

This method is to return a list of **MediaUser** which is a minimum list of information that is required by our randomizer. Our randomizer chooses which recordings Coach will accept from the batch supplied.

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<MediaUser>> GetMediaForUsersAsync(MediaForUsersArgs args, DataConnectorProperties properties)

:ref:`MediaForUsersArgs <MediaForUsersArgs-label>`
	Used to store all the information required by the Recorder to perform a search for recordings for a list of users.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


Please return a **IEnumerable** of :ref:`MediaUser-label` objects.

Additional information
~~~~~~~~~~~~~~~~~~~~~~

:ref:`SearchCriteria-label`
    The Search Criteria is a filter that is to be applied to your recordings.  If called from the Evaluation form, it is possible that no filter is supplied. If however, it is called from the **Schedule** then there will always be at least 2 criteria.
