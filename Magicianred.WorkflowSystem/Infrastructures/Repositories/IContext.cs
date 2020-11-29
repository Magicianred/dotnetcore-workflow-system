using Magicianred.WorkflowSystem.Infrastructures.Models;
using System.Collections.Generic;

namespace Magicianred.WorkflowSystem.Infrastructures.Repositories
{
    /// <summary>
    /// Interface for the Context
    /// </summary>
    public interface IContext
    {
        /// <summary>
        /// Workflows in the store
        /// </summary>
        IEnumerable<IWorkflow> Workflows { get; set; }

        /// <summary>
        /// Workflow statuses in the store
        /// </summary>
        IEnumerable<IWorkflowStatus> WorkflowStatuses { get; set; }

        /// <summary>
        /// Workflow next statuses in the store
        /// </summary>
        IEnumerable<IWorkflowNextStatus> WorkflowNextStatuses { get; set; }

        /// <summary>
        /// Method to persist data
        /// </summary>
        void SaveChanges();
    }
}
