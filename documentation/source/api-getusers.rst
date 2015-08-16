=============
GetUsersAsync
=============

This method is to return a list of **RecorderUser**.

.. code-block:: c#
   :linenos:

	public Task<IEnumerable<RecorderUser>> GetUsersAsync(DataConnectorProperties properties)

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Used to store user credentials required for an authentication challenge at the recorder end point.


Please return a **IEnumerable** of :ref:`RecorderUser-label` objects.
