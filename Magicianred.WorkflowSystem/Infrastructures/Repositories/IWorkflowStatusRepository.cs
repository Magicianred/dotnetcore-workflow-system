using Magicianred.WorkflowSystem.Infrastructures.Models;
using System.Linq;

namespace Magicianred.WorkflowSystem.Infrastructures.Repositories
{
    /// <summary>
    /// Interface of Workflow Status Repository
    /// </summary>
    public interface IWorkflowStatusRepository
    {
        /// <summary>
        /// Retrive a Workflow status by Id
        /// </summary>
        /// <param name="id">id of the workflow status</param>
        /// <returns>a workflow</returns>
        IWorkflowStatus GetById(int id);

        /// <summary>
        /// Retrive all workflows statuses
        /// </summary>
        /// <returns>All workflow statuses in the store</returns>
        IQueryable<IWorkflowStatus> GetAll();

        /// <summary>
        /// Insert a Workflow status in the store
        /// </summary>
        /// <param name="workflowStatus"></param>
        /// <returns>Id of the new Workflow status inserted</returns>
        int Add(IWorkflowStatus workflowStatus);

        /// <summary>
        /// Update a Workflow status in the store
        /// </summary>
        /// <param name="workflowStatus">A workflow status to update</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Update(IWorkflowStatus workflowStatus);

        /// <summary>
        /// Delete a workflow status by id
        /// </summary>
        /// <param name="id">id workflow status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(int id);

        /// <summary>
        /// Delete a workflow status
        /// </summary>
        /// <param name="workflowStatus">workflow status to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(IWorkflowStatus workflowStatus);
    }
}
