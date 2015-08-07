Plain old class objects
-----------------------

These are the classes the the RESTful implementation depends on.  These class can be used to pass information to the RESTful api or used to wrap data being returned from the RESTful api.


.. _RecorderUserInfo-label:

================
RecorderUserInfo
================

.. code-block:: c#
   :linenos:

    [DataContract()]
    public class RecorderUserInfo
    {
        [DataMember]
        public String FirstName { get; set; }

        [DataMember]
        public String LastName { get; set; }

        //The Automatic Call Distributor ID uniquely identifies an agent with a device; device being the equipment the call is directed to.  This ID identifies this user
        [DataMember]
        public String RecorderUserID { get; set; }

        //This is the unique identifier of a user account within the recorder
        [DataMember]
        public String RecorderAcountID { get; set; }

        //This is the password of the user’s account.
        [DataMember]
        public String RecorderAcountPassword { get; set; }

        [DataMember]
        public String Username { get; set; }

        [DataMember]
        public String Password { get; set; }

        [DataMember]
        public int TenantCode { get; set; }

        [DataMember]
        public String Mail { get; set; }
    }


.. _RecordingInfo-label:

=============
RecordingInfo
=============

.. code-block:: c#
   :linenos:

    [DataContract]
    public class RecordingInfo
    {
        /// <summary>
        /// Uniquely identifies the call from the client so we can ascertain (1) the schedule used for call and (2) the precise agent this is meant for
        /// </summary>
        [DataMember]
        public String Key { get; set; }

        //The code that uniquely identifies the recording, this could be a compound key
        [DataMember]
        public String RecordingID { get; set; }

        //The name of the file that uniquely identifies the recording
        [DataMember]
        public String RecordingFileName { get; set; }

        [DataMember]
        public String RecorderUserID { get; set; }

        [DataMember]
        public DateTime? RecordingDate { get; set; }

        [DataMember]
        public int TenantCode { get; set; }

        [DataMember]
        public string Metadata { get; set; }
    }


.. _SearchCriteria-label:

=============
SearchCriteria
=============

This POCO is used to wrap the search criteria that is destined for the recorder.

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


.. _DataConnectorEvaluationScore-label:

=============
DataConnectorEvaluationScore
=============

This POCO is used to wrap the evaluation score information that is destined for the recorder.

.. code-block:: c#
   :linenos:

    [DataContract]
    [Serializable]
    public class DataConnectorEvaluationScore : IDataConnectorEvaluationScore
    {
        [DataMember]
        public string TenantCode { get; set; }

        [DataMember]
        public string Username { get; set; }

        [DataMember]
        public string Password { get; set; }

        [DataMember]
        public string EvaluationId { get; set; }

        [DataMember]
        public string HeadlineScore { get; set; }

        [DataMember]
        public string ExtraScore { get; set; }

        [DataMember]
        public string UserId { get; set; }

        [DataMember]
        public string RecordingId { get; set; }
    }


.. _DataContractRecordingListFilter-label:

=============
DataContractRecordingListFilter
=============

This POCO is used to wrap the information required to return a subset of recordings from the recorder

.. code-block:: c#
   :linenos:

    [DataContract]
    [Serializable]
    public class DataContractRecordingListFilter : IDataContractRecordingListFilter
    {
        [DataMember]
        public string Key { get; set; }

        [DataMember]
        public int Limit { get; set; }

        [DataMember]
        public string TenantCode { get; set; }

        [DataMember]
        public string UserId { get; set; }

        [DataMember]
        public List<SearchCriteria> SearchCriteria { get; set; }

        [DataMember]
        public string TimeZone { get; set; }

        [DataMember]
        public string Username { get; set; }

        [DataMember]
        public string Password { get; set; }
    }
