using System;
using System.Collections.Generic;
using System.Text;

namespace Magicianred.WorkflowSystem.Infrastructures.Models
{
    /// <summary>
    /// A status of the workflow
    /// </summary>
    public interface IWorkflowStatus
    {
        /// <summary>
        /// Identity
        /// </summary>
        int Id { get; set; }
        int WorkflowId { get; set; }
        string Name { get; set; }
        string Description { get; set; }
        short TypeId { get; set; }

        IWorkflowStatusType Type { get; set; }
    }
}
