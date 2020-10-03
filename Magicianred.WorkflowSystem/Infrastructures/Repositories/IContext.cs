using Magicianred.WorkflowSystem.Infrastructures.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
        IList<IWorkflow> Workflows { get; set; }

        /// <summary>
        /// Method to persist data
        /// </summary>
        void SaveChanges();
    }
}
