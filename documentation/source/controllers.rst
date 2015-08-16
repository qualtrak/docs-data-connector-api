===========
Controllers
===========

Controllers are the RESTful API end points.  These controllers act as the conduit between **Coach** and your ``Connector`` implementation.  These controllers **should rarely change**.


BaseController
==============

All controllers inherit from this base Controller.

**Namespace:** ::

     Qualtrak.Coach.DataConnector.Controllers

**c# code:**

.. code-block:: c#
   :linenos:

   public class BaseApiController : ApiController
   {
       private const string TenantCodeHeaderKey = "TenantCode";
       private const string UsernameHeaderKey = "Username";
       private const string PasswordHeaderKey = "Password";

       protected DataConnectorProperties GetDataConnectorProperties()
       {
           var result = new DataConnectorProperties();
           result.TenantCode = this.GetValueFromHeaderKey(TenantCodeHeaderKey);
           result.Username = this.GetValueFromHeaderKey(UsernameHeaderKey);
           result.Password = this.GetValueFromHeaderKey(PasswordHeaderKey);
           return result;
       }

       private string GetValueFromHeaderKey(string key)
       {
           if (this.Request.Headers.Contains(key))
           {
               return this.Request.Headers.GetValues(key).First();
           }

           return null;
       }
   }



.. _controller-connector-label:

Connector
==========

Get Connector
~~~~~~~~~~~~~

To be used to check that the connector is present. Used predominatley by the **Integration Tool**.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers

**HTTP call:** ::

    GET api/connector

**c# code:**

.. code-block:: c#
   :linenos:

   public bool Get()
   {
       return true;
   }


.. _controller-users-label:

RecorderUsers
=============

Get list of users
~~~~~~~~~~~~~~~~~

To return a list of users from the recorder connector.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    GET api/recorder/users

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 9

    [DeflateCompression]
    [Route("recorder/users")]
    public async Task<IEnumerable<RecorderUser>> GetAsync()
    {
       var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();

       try
       {
           return await client.GetUsersAsync(this.GetDataConnectorProperties());
       }
       catch (Exception ex)
       {
           Trace.TraceError("connector : [{0}]", ex.Message);
       }

       return await Task.FromResult(new List<RecorderUser>());
    }



Dependency on:

    :ref:`RecorderUser <RecorderUser-label>`
    	Describes a Recorder User.


.. _controller-recordings-label:

RecorderMedia
=============

Get recording url
~~~~~~~~~~~~~~~~~

To get the url of a recording from the recorder connector.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    GET api/recorder/media?id=123abc&originalUrl=http://calls.recorder.com/recording.aspx?id=123abc

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 10,10

   [Route("recorder/media")]
   [HttpGet]
   public async Task<string> GetAsync(string id, string originalUrl)
   {
       var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();
       string result = string.Empty;

       try
       {
           result = await client.GetMediaUrlAsync(id, originalUrl, this.GetDataConnectorProperties());
       }
       catch (Exception ex)
       {
           Trace.TraceError("connector : [{0}]", ex.Message);
       }

       return result;
   }


Get list of recordings
~~~~~~~~~~~~~~~~~~~~~~

To get a list of recordings from the recorder connector for a specific **{userId}**.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    POST api/recorder/media/{userId}

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 9

    [DeflateCompression]
    [Route("recorder/media/{userId}")]
    [HttpPost]
    public async Task<IEnumerable<Media>> PostAsync(string userId, MediaForUserArgs args)
    {
      var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();
      try
      {
          return await client.GetMediaForUserAsync(userId, args, this.GetDataConnectorProperties());
      }
      catch (Exception ex)
      {
          Trace.TraceError("connector : [{0}]", ex.Message);
      }

      return await Task.FromResult(new List<Media>());
    }

Dependency on:

    :ref:`Media <Media-label>`
        Used to describe a recording from a Recorder.

    :ref:`MediaForUserArgs <MediaForUserArgs-label>`
        Used to describe a filter to be applied by the Recorder when requests recordings.


Get a list of Ids from arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Get the minimum inforation required by our randomizer for it to choose what recordings will eventually be used by **Coach**.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    POST api/recorder/media

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 9,9


    [DeflateCompression]
    [Route("recorder/media")]
    [HttpPost]
    public async Task<IEnumerable<MediaUser>> PostAsync(MediaForUsersArgs args)
    {
      var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();
      try
      {
          return await client.GetMediaForUsersAsync(args, this.GetDataConnectorProperties());
      }
      catch (Exception ex)
      {
          Trace.TraceError("connector : [{0}]", ex.Message);
      }

      return await Task.FromResult(new List<MediaUser>());
    }


Dependency on:

    :ref:`MediaUser <MediaUser-label>`
        Used to describe the relationship between a recording and a recorder user.

    :ref:`MediaForUsersArgs <MediaForUsersArgs-label>`
        Used to describe the search filter to be applied by the Recorder for recordings from a list of users.

Get a list of Media from list of media Ids
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Get recordings from the Recorder from the supplied list of Ids.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    POST api/recorder/media/full

**c# code:**

.. code-block:: c#
  :linenos:
  :emphasize-lines: 9,9

    [DeflateCompression]
    [Route("recorder/media/full")]
    [HttpPost]
    public async Task<IEnumerable<Media>> PostAsync(MediaByIds args)
    {
         var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();
         try
         {
             var response = await client.GetMediaByIdsAsync(args.ids, this.GetDataConnectorProperties());
             return response;
         }
         catch (Exception ex)
         {
             Trace.TraceError("connector : [{0}]", ex.Message);
         }

         return await Task.FromResult(new List<Media>());
    }


Dependency on:

    :ref:`Media <Media-label>`
        Used to describe a recording from a Recorder.

    :ref:`MediaByIds <MediaByIds-label>`
        Used to contain a list of recording Ids for the Recorder to process.



.. _controller-score-label:

Score
==========

Push Score
~~~~~~~~~~

To be used you want Evaluation headline scores to be persisted by the Recorder repository.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    POST api/recorder/evaluationscore

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 8

     [Route("recorder/evaluationscore")]
     public async Task PostAsync(SendEvaluationScoreArgs args)
     {
         var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();

         try
         {
            await client.SendEvaluationScoreAsync(args, this.GetDataConnectorProperties());
         }
         catch (Exception ex)
         {
             Trace.TraceError("connector : [{0}]", ex.Message);
         }
     }

Dependency on:

    :ref:`SendEvaluationScoreArgs <SendEvaluationScoreArgs-label>`
	   Contains the Headline Score of an Evaluation that is to be persisted by the Recorder.

.. _controller-stream-label:

Stream
==========

Stream recording
~~~~~~~~~~~~~~~~

To be used to obtain a recording stream.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Controllers.Recorder

**HTTP call:** ::

    GET api/recorder/stream

**c# code:**

.. code-block:: c#
   :linenos:
   :emphasize-lines: 7

    [Route("recorder/stream")]
    public async Task<HttpResponseMessage> GetAsync(string url)
    {
      var client = NinjectWebCommon.Kernel.Get<IRecorderApiFacade>();
      try
      {
          var stream = await client.GetStreamAsync(url);
          bool match = false;

          var output = this.Request.CreateResponse(HttpStatusCode.OK);
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
