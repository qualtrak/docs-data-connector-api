GetRecordingUrl
===============

This method will return a url that will be loaded into the media player. The url may need to undergo further amendments before it can get the recording and this is where you can programmatically perform such an operation. 

.. code-block:: c#
   :linenos:
   
	public string GetRecordingUrl(string recordingId, string recordingOriginalUrl, 
		string username, string password)

recordingId
	This is a unique identifier to the recording originating from your recorder.
	
recordingOriginalUrl
	This is the original url. This is to be returned if you do not wish to make any modifications to the original url.

username
	This is the username of the user who is currently signed into Coach.
	
password
	This is the clear text password of the user who is currently signed into Coach.
	
Please return either the recordingOriginalUrl or a modified url.
