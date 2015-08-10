
GetStream
=========

If you require some form of proxy intervention when getting a recording then this is programmatically the place to perform such an operations

.. code-block:: c#
   :linenos:

	public Stream GetStream(string url)

url
	This is the url that will generate a stream and can be used as part of the url if you need to do something particular with the returned recording.

Please return a **Stream**

How can I use it?
~~~~~~~~~~~~~~~~~

.. compound::

   An example of how you can use this API is here. You enter this ::

       /data-connector/api/stream?url=

   into the ``Recordings root folder`` input field when configuring a media player from within the **Console**.  This will ensure that every url is pre suffix with this value first resulting the stream being loaded into the media player.


If your recordings need to satify a Basic Authentication challenge then please see our :ref:`basicauthhandler-label` instead
