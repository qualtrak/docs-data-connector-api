================
GetMediaUrlAsync
================

This method will return a url that will be loaded into the media player. The url may need to undergo further amendments before it can get the recording and this is where you can programmatically perform such an operation.

.. code-block:: c#
   :linenos:

   public Task<string> GetMediaUrlAsync(string id, string originalUrl, DataConnectorProperties properties)

id
	This is a unique identifier to the recording originating from your recorder.

originalUrl
	This is the original url. This is to be returned if you do not wish to make any modifications to the original url.

:ref:`DataConnectorProperties <DataConnectorProperties-label>`
	Describes the user credentials required for an authentication challenge by the Recorder.


Please return either the originalUrl or a modified url.
