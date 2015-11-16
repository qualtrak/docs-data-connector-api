==================
IRecorderApiFacade
==================

This interface must be implemented in your **Data Connector**. However, not all implementations require coding.  For example, if you don't need to implement an esoteric way of streaming your media to Coach then you don't need to code the **GetStreamAsync** method.

.. code-block:: c#
   :linenos:

    public interface IRecorderApiFacade
    {
        Task<IEnumerable<Media>> GetMediaByIdsAsync(IEnumerable<string> ids, DataConnectorProperties properties);
        Task<IEnumerable<Media>> GetMediaForUserAsync(string userId, MediaForUserArgs args, DataConnectorProperties properties);
        Task<IEnumerable<MediaUser>> GetMediaForUsersAsync(MediaForUsersArgs args, DataConnectorProperties properties);
        Task<string> GetMediaUrlAsync(string id, string originalUrl, DataConnectorProperties properties);
        Task<Stream> GetStreamAsync(string url);
        Task<IEnumerable<RecorderUser>> GetUsersAsync(DataConnectorProperties properties);
        Task SendEvaluationScoreAsync(SendEvaluationScoreArgs args, DataConnectorProperties properties);
    }
