==================
GetMediaByIdsAsync
==================

This method is to return a list of **Media**

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<Media>> GetMediaByIdsAsync(IEnumerable<string> ids, DataConnectorProperties properties)

IEnumerable<string>
	A list of recording ids originating from the recorder. This list is shortened [normally] list of recordings that was originally returned by the **GetMediaForUsersAsync** call.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


Please return a **IEnumerable** of :ref:`Media-label` objects.

Additional information
~~~~~~~~~~~~~~~~~~~~~~

:ref:`Metadata <Metadata-label>`
    You can also return other data to **Coach** that is outside of the original search filter.
