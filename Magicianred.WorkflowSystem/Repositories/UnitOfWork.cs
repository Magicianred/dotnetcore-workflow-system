using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Repositories
{
    /// <summary>
    /// A unit of work class
    /// </summary>
    public class UnitOfWork : IUnitOfWork
    {
        /// <summary>
        /// A repository for Workflow
        /// </summary>
        public IWorkflowRepository WorkflowRepository { get; set; }

        /// <summary>
        /// To persist data
        /// </summary>
        public void SaveChanges()
        {
            throw new NotImplementedException();
        }
    }
}
