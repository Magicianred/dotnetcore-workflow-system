using Magicianred.WorkflowSystem.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Repositories
{
    /// <summary>
    /// Interface for unit of work
    /// </summary>
    public interface IUnitOfWork
    {
        /// <summary>
        /// Repository of Workflow
        /// </summary>
        IWorkflowRepository WorkflowRepository { get; set; }

        void SaveChanges();
    }
}
