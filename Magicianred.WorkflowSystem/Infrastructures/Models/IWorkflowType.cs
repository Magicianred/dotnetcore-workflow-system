using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    /// <summary>
    /// A type of Workflow
    /// </summary>
    public interface IWorkflowType
    {
        /// <summary>
        /// Identity
        /// </summary>
        short Id { get; set; }
        /// <summary>
        /// Name
        /// </summary>
        string Name { get; set; }
        /// <summary>
        /// Description
        /// </summary>
        string Description { get; set; }
    }
}
