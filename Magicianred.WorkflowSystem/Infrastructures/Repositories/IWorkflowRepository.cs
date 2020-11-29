using Magicianred.WorkflowSystem.Infrastructures.Models;
using System.Linq;

namespace Magicianred.WorkflowSystem.Infrastructures.Repositories
{
    /// <summary>
    /// Interface of Workflow repository
    /// </summary>
    public interface IWorkflowRepository
    {
        /// <summary>
        /// Retrive a Workflow by Id
        /// </summary>
        /// <param name="id">id of the workflow</param>
        /// <returns>a workflow</returns>
        IWorkflow GetById(int id);

        /// <summary>
        /// Retrive all workflows
        /// </summary>
        /// <returns>All workflow in the store</returns>
        IQueryable<IWorkflow> GetAll();

        /// <summary>
        /// Insert a Workflow in the store
        /// </summary>
        /// <param name="workflow"></param>
        /// <returns>Id of the new Workflow inserted</returns>
        int Add(IWorkflow workflow);

        /// <summary>
        /// Update a Workflow in the store
        /// </summary>
        /// <param name="workflow">A workflow to update</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Update(IWorkflow workflow);

        /// <summary>
        /// Delete a workflow by id
        /// </summary>
        /// <param name="id">id workflow to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(int id);

        /// <summary>
        /// Delete a workflow 
        /// </summary>
        /// <param name="workflow">workflow to delete</param>
        /// <returns>True if succed, false otherwise</returns>
        bool Delete(IWorkflow workflow);
    }
}
