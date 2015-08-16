=======================
Plain old class objects
=======================

These are the classes the the RESTful implementation depends on.  These ``classes`` can be used to pass information to the RESTful API or used to wrap data being returned from the RESTful API.


.. _RecorderUser-label:

RecorderUser
============

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
    public class MediaUser
    {
        [DataMember]
        public string MediaId { get; set; }

        [DataMember]
        public string RecorderUserId { get; set; }
    }



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
        [DataMember]
        public string Id { get; set; }

        [DataMember]
        public string SearchVariableName { get; set; }

        [DataMember]
        public string SearchVariableDisplayName { get; set; }

        [DataMember]
        public string SearchVariableValue { get; set; }

        [DataMember]
        public SearchCondition SearchCondition { get; set; }

        [DataMember]
        public System.TypeCode SearchVariableDataType { get; set; }
    }



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
