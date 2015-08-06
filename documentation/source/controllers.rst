Controllers
===========

Controllers are the RESTful API end points.  These controllers act as the conduit between ``Coach`` and your ``Connector`` implementation.  These controllers **should rarely change**.


.. _controller-connector-label:

==========
Connector
==========

Get Connector
~~~~~~~~~~~~~

To be used to check that the connector is present. *Used predominatley by the Test Suite*.

.. code-block:: xml

    GET api/connector

.. code-block:: c#
   :linenos:


    public bool Get()
    {
        return true;
    }


.. _controller-users-label:

=====
Users
=====

Get list of users
~~~~~~~~~~~~~~~~~

To return a list of users from the rcorder connector.

.. code-block:: xml

    GET api/Users?tenantCode=1000&username=manager.a&password=123456



.. code-block:: c#
   :linenos:
   :emphasize-lines: 8,8

    public IEnumerable<RecorderUserInfo> Get(string tenantCode, string username, string password)
    {
        var list = new List<RecorderUserInfo>();
        var client = NinjectWebCommon.Kernel.Get<IApiFacade>();

        try
        {
            list = client.GetUsers(tenantCode, username, password);
        }
        catch (Exception ex)
        {
            Trace.TraceError("connector : [{0}]", ex.Message);
        }

        return list;
    }



Dependency on:

.. function:: RecorderUserInfo

	POCO that holds Recorder User information.


.. _controller-recordings-label:

==========
Recordings
==========

Get recoring url
~~~~~~~~~~~~~~~~

To get the url of a recording from the recorder connector.

.. code-block:: xml

    GET api/recordings?tenantCode=1000&username=manager.a&password=123456&recordingid=123abc&originalRecordingUrl=http://calls.recorder.com/recording.aspx?id=123abc

.. code-block:: c#
   :linenos:
   :emphasize-lines: 4,4


    public string Get(string tenantCode, string username, string password, string recordingId, string originalRecordingUrl)
    {
        var client = NinjectWebCommon.Kernel.Get<IApiFacade>();
        var url = client.GetRecordingUrl(recordingId, originalRecordingUrl, username, password);
        return url;
    }


Get list of recordings
~~~~~~~~~~~~~~~~~~~~~~

To get a list of recordings from the recorder connector.

.. code-block:: xml

    POST api/recordings

    {
        "Key":"",
        "Limit":"",
        "TenantCode":"",
        "UserId":"",
        "SearchCriteria": [
        ],
        "TimeZone":"",
        "Username":"",
        "Password":""
    }


.. code-block:: c#
   :linenos:
   :emphasize-lines: 4,4

    public IEnumerable<RecordingInfo> Post(DataContractRecordingListFilter filter)
    {
        var client = NinjectWebCommon.Kernel.Get<IApiFacade>();
        var response = client.GetRecordings(filter.Key, filter.Limit, "1000", filter.UserId, filter.SearchCriteria, filter.Username, filter.Password);
        return response;
    }

Dependency on:

.. function:: RecordingInfo

	POCO that holds Recording information.

.. function:: DataContractRecordingListFilter

    POCO used to wrap the information required to return a subset of recordings from the recorder

.. _controller-score-label:

==========
Score
==========

Push Score
~~~~~~~~~~

To be used to check that the connector is present. *Used predominatley by the Test Suite*.

.. code-block:: xml

    POST api/score

.. code-block:: c#
   :linenos:
   :emphasize-lines: 4,5,6

    public void Post(DataConnectorEvaluationScore evaluationScore)
    {
        var client = NinjectWebCommon.Kernel.Get<IApiFacade>();
        client.PostEvaluationScore(evaluationScore.TenantCode, evaluationScore.Username,
            evaluationScore.Password, evaluationScore.EvaluationId, evaluationScore.HeadlineScore,
            evaluationScore.ExtraScore, evaluationScore.UserId, evaluationScore.RecordingId);
    }

Dependency on:

.. function:: DataConnectorEvaluationScore

	POCO that holds evaluation information information.

.. _controller-stream-label:

==========
Stream
==========

Stream recording
~~~~~~~~~~~~~~~~

To be used to obtain a recording stream.

.. code-block:: xml

    GET api/stream

.. code-block:: c#
   :linenos:
   :emphasize-lines: 6

    public System.Net.Http.HttpResponseMessage Get(string url)
    {
        var client = NinjectWebCommon.Kernel.Get<IApiFacade>();
        try
        {
            var stream = client.GetStream(url);
            bool match = false;
            HttpResponseMessage output;

            output = this.Request.CreateResponse(HttpStatusCode.OK);
            output.Content = new StreamContent(stream);
            output.Content.Headers.ContentDisposition = new ContentDispositionHeaderValue("attachment");

            foreach (var item in this._listOfMediaFileTypes)
            {
                if (url.Contains(item.Ext))
                {
                    output.Content.Headers.ContentType = new MediaTypeHeaderValue(item.MimeType);
                    output.Content.Headers.ContentDisposition.FileName = "recording" + item.Ext;
                    match = true;
                    break;
                }
            }

            if (!match)
            {
                output.Content.Headers.ContentType = new MediaTypeHeaderValue("audio/x-wav");
                output.Content.Headers.ContentDisposition.FileName = "recording.wav";
            }

            return output;
        }
        catch (Exception ex)
        {
            Trace.TraceError("connector : [{0}]", ex.Message);
        }

        return new HttpResponseMessage(HttpStatusCode.NotFound);
    }
