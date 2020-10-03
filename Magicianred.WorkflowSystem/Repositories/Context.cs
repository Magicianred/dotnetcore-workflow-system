using Magicianred.WorkflowSystem.Infrastructures.Models;
using Magicianred.WorkflowSystem.Infrastructures.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Magicianred.WorkflowSystem.Repositories
{
    /// <summary>
    /// A context class
    /// </summary>
    public class Context : IContext
    {
        /// <summary>
        /// A workflow store
        /// </summary>
        public IList<IWorkflow> Workflows { get; set; }

        /// <summary>
        /// To persist data
        /// </summary>
        public void SaveChanges()
        {
            throw new NotImplementedException();
        }
    }
}
