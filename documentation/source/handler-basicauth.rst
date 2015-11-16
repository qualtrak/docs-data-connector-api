.. _basicauthhandler-label:

===================================
BasicAuthenticationGetMedia Handler
===================================

This is a proxy that will download the recording when needing to satisfy a Basic Authentication challenge.

.. compound:: 

    An example of how you can use this api is here. You enter this ::

       http://localhost:20908/play.media?url=http://stream.recorderabc.net/db/VOICE_RECORDING.GET?&INDEX=

    into the ``Recordings root folder`` input field when configuring a media player from within the **Console**.  This will ensure that every url is presuffix with this value first resulting the stream being loaded into the media player.
    
    This approach can also be used to stream recordings from another location.    
   