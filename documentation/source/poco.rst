=======================
Plain old class objects
=======================

These are the classes the the RESTful implementation depends on.  These ``classes`` can be used to pass information to the RESTful API or used to wrap data being returned from the RESTful API.

.. important::

    When returning the filename of the media back to Coach, you must only include the **filename.ext** (e.g. ``agent201506211015.wav``) and not the absolute filepath or url. Coach generates the url from the information provided in the **Recorder Media** configuration page

.. _RecorderUser-label:

RecorderUser
============

Describes a Recorder User.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract()]
    public class RecorderUser
    {
        [DataMember]
        public string AccountId { get; set; }

        [DataMember]
        public string FirstName { get; set; }

        //The Automatic Call Distributor ID uniquely identifies an agent with a device; device being the equipment the call is directed to.  This ID identifies this user
        [DataMember]
        public string LastName { get; set; }

        //This is the unique identifier of a user account within the recorder
        [DataMember]
        public string Mail { get; set; }

        //This is the password of the user’s account.
        [DataMember]
        public string Password { get; set; }

        [DataMember]
        public string UserId { get; set; }

        [DataMember]
        public string Username { get; set; }
    }


.. _Media-label:

Media
=====

Used to describe a recording from a Recorder.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    public class Media
    {
        [DataMember]
        public string Id { get; set; }

        [DataMember]
        public string FileName { get; set; }

        //The name of the file that uniquely identifies the recording
        [DataMember]
        public string RecorderUserId { get; set; }

        [DataMember]
        public DateTime? Date { get; set; }

        [DataMember]
        public string Metadata { get; set; }
    }




.. _MediaForUserArgs-label:

MediaForUserArgs
================

Used to describe a filter to be applied by the Recorder when requests recordings.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder.Args

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    public class MediaForUserArgs
    {
        [DataMember]
        public int Limit { get; set; }

        [DataMember]
        public List<SearchCriteria> SearchCriteria { get; set; }

        [DataMember]
        public string TimeZone { get; set; }
    }



.. _MediaUser-label:

MediaUser
=========

Used to describe the relationship between a recording and a recorder user.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    [Serializable]
    public class MediaUser
    {
        //The code that uniquely identifies the recording, this could be a compound key
        [DataMember(Name = "id")]
        public string MediaId { get; set; }

        [DataMember(Name = "userId")]
        public string RecorderUserId { get; set; }
    }

.. important::

    The ``RecorderUserId`` is a string and not an integer (number). For example, '009' does not equal 9


.. _MediaForUsersArgs-label:

MediaForUsersArgs
=================

Used to describe the search filter to be applied by the Recorder for recordings from a list of users.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder.Args

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    public class MediaForUsersArgs
    {
        [DataMember]
        public int Limit { get; set; }

        [DataMember]
        public List<SearchCriteria> SearchCriteria { get; set; }

        [DataMember]
        public string TimeZone { get; set; }

        [DataMember]
        public IEnumerable<string> UserIds { get; set; }
    }




.. _MediaByIds-label:

MediaByIds
==========

Used to contain a list of recording Ids for the Recorder to process.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder.Args

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    public class MediaByIds
    {
        [DataMember]
        public IEnumerable<string> ids { get; set; }
    }


.. _SearchCriteria-label:

SearchCriteria
==============

Used to describe one search filter.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Shared

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    public class SearchCriteria
    {
        DataMember]
        public string Id { get; set; }

        [DataMember(Name = "key")]
        public string Key { get; set; }

        [DataMember(Name = "label")]
        public string Label { get; set; }

        [DataMember(Name = "value")]
        public string Value { get; set; }

        [DataMember(Name = "condition")]
        public SearchCondition Condition { get; set; }

        [DataMember(Name = "dataType")]
        public System.TypeCode DataType { get; set; }
    }


**Notes**:

|    ``Id`` is an identifier used by Coach for mapping purposes
|    ``Key`` is the id of the field that means something to your connect; e.g. recording_date
|    ``Label`` is the on-screen display name for this field when being prompted for a value
|    ``Value`` is the value that is being passed to your connector for searches to be filter on
|

Dependency on:

    :ref:`SearchCondition <SearchCondition-label>`
    	Enum of all possible conditions.


.. _SendEvaluationScoreArgs-label:

SendEvaluationScoreArgs
=======================

Contains the Headline Score of an Evaluation that is to be persisted by the Recorder.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Recorder.Args

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    [Serializable]
    public class DataConnectorEvaluationScore : IDataConnectorEvaluationScore
    {
        [DataMember]
        public string EvaluationId { get; set; }

        [DataMember]
        public string ExtraScore { get; set; }

        [DataMember]
        public string HeadlineScore { get; set; }

        [DataMember]
        public string MediaId { get; set; }

        [DataMember]
        public string UserId { get; set; }
    }

.. _DataConnectorProperties-label:

DataConnectorProperties
=======================

Describes the user credentials required for an authentication challenge by the Recorder.

**Namespace:** ::

    Qualtrak.Coach.DataConnector.Core.Shared

**c# code:**

.. code-block:: c#
   :linenos:

    [DataContract]
    [Serializable]
    public class DataConnectorProperties : IDataConnectorEvaluationScore
    {
        [DataMember]
        public string Password { get; set; }

        [DataMember]
        public string TenantCode { get; set; }

        [DataMember]
        public string Username { get; set; }
    }
