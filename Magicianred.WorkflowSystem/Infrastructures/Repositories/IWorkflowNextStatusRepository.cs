using Magicianred.WorkflowSystem.Infrastructures.Models;
using System.Linq;

namespace Magicianred.WorkflowSystem.Infrastructures.Repositories
{
    /// <summary>
    /// Interface of Workflow Next Status Repository
    /// </summary>
    public interface IWorkflowNextStatusRepository
    {
        /// <summary>
        /// Retrive a Workflow next status by Id
        /// </summary>
        /// <param name="id">id of the workflow next status</param>
        /// <returns>a workflow</returns>
        IWorkflowNextStatus GetById(int id);

        /// <summary>
        /// Retrive all workflows next statuses
        /// </summary>
        /// <returns>All workflow next statuses in the store</returns>
        IQueryable<IWorkflowNextStatus> GetAll();

        /// <summary>
        /// Retrive all workflows next statuses by initial status
        /// </summary>
        /// <returns>All workflow next statuses by initial status id in the store</returns>
        IQueryable<IWorkflowNextStatus> GetAllByInitialStatusId(int initialStatusId);

        /// <summary>
        /// Insert a Workflow next status in the store
        /// </summary>
        /// <param name="workflowNextStatus"></param>
        /// <returns>Id of the new Workflow next status inserted</returns>
        int Add(IWorkflowNextStatus workflowNextStatus);

        /// <summary>
        /// Update a Workflow next status in the store
        /// </summary>
        /// <param name="workflowNextStatus">A workflow next status to update</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Update(IWorkflowNextStatus workflowNextStatus);

        /// <summary>
        /// Delete a workflow next status by id
        /// </summary>
        /// <param name="id">id workflow next status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(int id);

        /// <summary>
        /// Delete a workflow next status
        /// </summary>
        /// <param name="workflowNextStatus">workflow next status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(IWorkflowNextStatus workflowNextStatus);
    }
}
