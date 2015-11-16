=============
GetUsersAsync
=============

This method is to return a list of **RecorderUser**.

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<RecorderUser>> GetUsersAsync(DataConnectorProperties properties)

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


Please return a **IEnumerable** of :ref:`RecorderUser-label` objects.
